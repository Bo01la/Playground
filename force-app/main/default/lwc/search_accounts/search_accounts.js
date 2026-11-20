import { LightningElement, wire } from "lwc";

// importing the method we created in the apex class
import GetAccountsForSearchAccountsLWC from "@salesforce/apex/GetAccountsForSearchAccountsLWC.getAccounts";

export default class Search_accounts extends LightningElement {
  searchKey;
  fetchedRecords;

  handleSearch(e) {
    this.searchKey = e.target.value;
    if (this.searchKey === "") {
      this.searchKey = null;
    }
  }

  @wire(GetAccountsForSearchAccountsLWC, { accountName: "$searchKey" })
  handleFetchData({ data, error }) {
    if (data) {
      this.fetchedRecords = data;
    }
    if (error) {
      console.log(`ERROR => ${JSON.stringify(error)}`);
      this.fetchedRecords = null;
    }
  }

  get hasRecords() {
    return this.fetchedRecords && this.fetchedRecords.length > 0;
  }
}
