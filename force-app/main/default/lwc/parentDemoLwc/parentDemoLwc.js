import { LightningElement } from "lwc";

export default class ParentDemoLwc extends LightningElement {
  // Data to pass down to the child's @api property  (@api coolProperty)
  childHeader = "title set by parent in HTML";

  handleCallChildMethod() {
    // accessing the child component using querySelector
    const childComponent = this.template.querySelector("c-child-demo-lwc");

    // Always check if the component exists before calling methods on it
    if (childComponent) {
      // here we are doing 2 things// 1. Call the child's public method, passing a message
      // 2. Optionally, handle the return value from the child method that we specified
      const returnValue = childComponent.childCoolMethod("parent is triggered");

      console.log("returned value from the child is :: ", returnValue);
    }
  }
}
