//* example for  Imperative Apex Calls

import { LightningElement, track } from "lwc";

// importing the method we created in the controlled class (userCardGetAccountDetailsLWC)
import getAccountDetails from "@salesforce/apex/userCardGetAccountDetailsLWC.getAccountDetails";

//! note: this LWC display the details of 'Edge Communications' account only. not dynamic to each opportunity record

export default class GetAccountLWC extends LightningElement {
  @track accounts = [];
  errorMessage = "";

  async displayAccount() {
    try {
      const result = await getAccountDetails({
        accountName: "Edge Communications"
      });
      this.accounts = result;

      // the button will log the account details in the consule
      console.log("the account details are: " + JSON.stringify(this.accounts));
    } catch (error) {
      // this error is received from the AuraHandledException in the class
      this.errorMessage = error.body ? error.body.message : error.message;
      console.error("Error fetching accounts: ", JSON.stringify(error));
    }
  }
}
