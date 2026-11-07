import { LightningElement, api } from "lwc";

export default class Child_demo_2 extends LightningElement {
  @api childCoolProperty;

  handleFireCustomEvent() {
    // create the payload/data
    const payload = {
      message1: "1st message from child",
      message2: "2nd message from child"
    };
    // create the custom event
    const customEvnt = new CustomEvent("childevent", {
      detail: payload,
      bubbles: false,
      composed: false
    });

    // dispatch the custom event for external use
    this.dispatchEvent(customEvnt);
  }

  @api childCoolMethod() {
    console.log("this is a message invoked from child method");

    this.handleFireCustomEvent(); // <-- firing the event method to sned data to parent
  }
}
