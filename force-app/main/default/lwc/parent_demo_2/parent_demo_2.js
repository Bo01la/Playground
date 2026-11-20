import { LightningElement } from "lwc";

export default class Parent_demo_2 extends LightningElement {
  parentPassedText = "hello from parent";
  messageFromChild1 = "11111111111";
  messageFromChild2 = "222222222222222";

  handleDataInParent(event) {
    const receivedData = event.detail;
    this.messageFromChild1 = `1st message from child is {{ ${receivedData.message1}}}`;
    this.messageFromChild2 = `2nd message from child is {{ ${receivedData.message2}}}`;
  }

  handleCallChildMethod() {
    const childComp = this.template.querySelector("c-child_demo_2");
    if (childComp) {
      childComp.childCoolMethod();
    }
    console.log(this.messageFromChild1);
    console.log(this.messageFromChild2);
  }
}
