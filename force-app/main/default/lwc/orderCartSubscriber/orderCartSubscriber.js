import { LightningElement, wire } from "lwc";

import {
  subscribe,
  unsubscribe,
  APPLICATION_SCOPE,
  MessageContext
} from "lightning/messageService";

import MEDICATION_CART_CHANNEL from "@salesforce/messageChannel/MedicationCartChannel__c";

export default class OrderCartSubscriber extends LightningElement {
  cartItems = [];
  subscribtion = null;

  @wire(MessageContext)
  messageContext;

  connectedCallback() {
    this.subscribeToChannel();
  }

  subscribeToChannel() {
    if (!this.subscribtion) {
      this.subscribtion = subscribe(
        this.messageContext,
        MEDICATION_CART_CHANNEL,
        (payload) => this.handleIncomingMessage(payload),
        { scope: APPLICATION_SCOPE }
      );
    }
  }

  // payload = {medicationId: 'MED-03', medicationName: 'Lantus', unitPrice:500, actionType: 'ADD'}

  handleIncomingMessage(payload) {
    // 1. Handle the Clear Remote Cart action
    if (payload.actionType === "CLEAR") {
      this.cartItems = [];
      return;
    }

    // 2. Handle the Add to Cart action
    if (payload.actionType === "ADD") {
      const existingItem = this.cartItems.find(
        (item) => item.medicationId === payload.medicationId
      );

      if (existingItem) {
        // Item already in cart: map to a new array with incremented quantity & subtotal
        this.cartItems = this.cartItems.map((item) => {
          if (item.medicationId === payload.medicationId) {
            const updatedQty = item.quantity + 1;
            return {
              ...item,
              quantity: updatedQty,
              subtotal: updatedQty * item.unitPrice
            };
          }
          return item;
        });
      } else {
        // New item: spread payload and initialize quantity & subtotal
        const newItem = {
          ...payload,
          quantity: 1,
          subtotal: payload.unitPrice
        };
        this.cartItems = [...this.cartItems, newItem];
      }
    }
  }

  get hasItems() {
    return this.cartItems.length > 0;
  }

  handleRemoveItem(e) {
    const medId = e.currentTarget.dataset.id;
    this.cartItems = this.cartItems.filter((med) => med.medicationId !== medId);
  }

  get grandTotal() {
    return this.cartItems.reduce((total, item) => total + item.subtotal, 0);
  }

  //? ------>>> unsubscribe <<<------
  disconnectedCallback() {
    this.unsubscribeFromChannel();
  }

  unsubscribeFromChannel() {
    if (this.subscribtion) {
      unsubscribe(this.subscribtion);
      this.subscribtion = null;
    }
  }
}
