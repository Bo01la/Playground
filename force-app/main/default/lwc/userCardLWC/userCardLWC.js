//? exampple for Declarative Data Fetching

import { LightningElement, wire, api } from "lwc";

import { getFieldValue, getRecord } from "lightning/uiRecordApi";

import USER_ID from "@salesforce/user/Id";

import FIRST_NAME_FIELD from "@salesforce/schema/User.FirstName";
import EMAIL_FIELD from "@salesforce/schema/User.EMAIL";

const fields = [FIRST_NAME_FIELD, EMAIL_FIELD];

export default class UserCardLWC extends LightningElement {
  headerText = "Current User Card";

  userId = USER_ID;

  @api recordId;
  @api objectApiName;

  @wire(getRecord, { recordId: "$userId", fields: fields })
  userData;

  // userName = this.userData.data?.fields?.FirstName?.value
  // /* we can't use the above line for 2 reasons:
  // 1- the optional chaining (?.), or deep property paths inside {} is not allowed in LWC HTML
  // 2- this wasn't reactive - userData may not be available at construction time, so this.userData.data is undefined. Instead, use a getter below.
  // */

  get firstName() {
    // getter method that will be passed to the HTML as {firstName} and will return the value of FIRST_NAME_FIELD diretly
    return getFieldValue(this.userData.data, FIRST_NAME_FIELD);
  }
  get email() {
    return getFieldValue(this.userData.data, EMAIL_FIELD);
  }

  get isDataLoaded() {
    // to display a spinner if the user data is not yet loaded
    return this.userData && this.userData.data;
  }
}
