import { LightningElement, track } from "lwc";

export default class DynamicTextLWC extends LightningElement {
  @track text = "";

  //* or we can remove the (track) from import and (@track) in line 5 because modern LWC consider (Strings, Numbers, Booleans) as reactive values by default and no need to add @track before it to make it dynamic
  //? text = "";

  changeTextHandler(event) {
    this.text = event.target.value;
  }
}
