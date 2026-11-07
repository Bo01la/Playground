// import { LightningElement, api } from 'lwc';
// import { NavigationMixin } from 'lightning/navigation';
// import { FlowNavigationFinishEvent } from 'lightning/flowSupport';

// export default class NavigateToRecordLWC extends NavigationMixin(LightningElement) {
//     // استقبال الـ ID من الـ Flow
//     @api recordId;

//     // الدالة اللي بتشتغل لما اليوزر يدوس على الزرار
//     handleNavigate() {
//       console.log("sha8al el sho8lllllllwiencdfcncfncen")
//         // بناء الرابط المباشر لصفحة الـ Case
//         const recordUrl = `/lightning/r/Case/${this.recordId}/view`;

//         // أمر فتح الرابط
//         this[NavigationMixin.Navigate]({
//             type: 'standard__webPage',
//             attributes: {
//                 url: recordUrl
//             }
//         });

//         // // (اختياري) أمر إنهاء الـ Flow بعد ما اليوزر يدوس على الزرار
//         // const finishEvent = new FlowNavigationFinishEvent();
//         // this.dispatchEvent(finishEvent);
//     }
// }

import { LightningElement, api } from "lwc";

export default class NavigateToRecordLWC extends LightningElement {
  // just by adding (@api) to a variable called (recordId) we can access the Id of the record at which the // component is used from Flow  and get the record Id dynamically
  // also (@api objectApiName) will give the object name at which the record belogs to

  @api recordId;

  handleNavigate() {
    const recordUrl = `/lightning/r/Pre_Authorization_Request__c/${this.recordId}/view`;

    // الطريقة دي بتجبر المتصفح يفتح الرابط في نفس الشاشة بشكل مباشر
    window.top.location.href = recordUrl;

    // أو لو عايزها تفتح في تابة جديدة (New Tab) استخدم السطر ده بدل اللي فوق:
    // window.open(recordUrl, "_blank");
  }
}
