import { LightningElement, api } from "lwc";

export default class ChildDemoLwc extends LightningElement {
  // 1. Public Property exposed to the parent
  @api coolProperty;

  // Internal reactive property to show method execution
  actionStatus = "waiting for parent to click the button";

  @api childCoolMethod(messagePayload) {
    this.actionStatus = `the parent component said "${messagePayload}"`;
    return "child received the message successfully"; // Methods can return data to the parent
  }
}

//? the child only receive responce from the parent when a trigger / action is taken by the parent (click a button)
//? it can return to parent but can not trigger the parent
