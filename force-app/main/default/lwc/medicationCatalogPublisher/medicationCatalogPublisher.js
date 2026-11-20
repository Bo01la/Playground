/* eslint-disable no-confusing-arrow */
import { LightningElement, wire } from "lwc";
import { publish, MessageContext } from "lightning/messageService";
import MEDICATION_CART_CHANNEL from "@salesforce/messageChannel/MedicationCartChannel__c";

const INITIAL_MEDICATIONS = [
  {
    id: "MED-01",
    name: "Augmentin 1g",
    category: "Antibiotic",
    price: 145,
    stock: 12
  },
  {
    id: "MED-02",
    name: "Panadol 500",
    category: "Analgesic",
    price: 300,
    stock: 20
  },
  {
    id: "MED-03",
    name: "Lantus",
    category: "Diabetic Med",
    price: 500,
    stock: 5
  },
  {
    id: "MED-04",
    name: "Concor 5mg",
    category: "HTN Med",
    price: 200,
    stock: 30
  }
];

export default class MedicationCatalogPublisher extends LightningElement {
  searchKey = ""; // Initialized as empty string to prevent .toLowerCase() crash
  medications = INITIAL_MEDICATIONS.map((med) => ({ ...med }));

  @wire(MessageContext)
  messageContext;

  handleSearchChange(e) {
    this.searchKey = e.target.value;
  }

  get filteredMedications() {
    const key = this.searchKey.toLowerCase();
    return this.medications
      .filter((item) => item.name.toLowerCase().includes(key))
      .map((item) => ({
        ...item,
        isOutOfStock: item.stock === 0 // Feeds disabled={med.isOutOfStock} in HTML
      }));
  }

  get hasMedications() {
    return this.filteredMedications.length > 0;
  }

  handleAddToCart(e) {
    const medId = e.currentTarget.dataset.id;
    const selectedMed = this.medications.find((item) => item.id === medId);

    if (!selectedMed || selectedMed.stock <= 0) {
      return;
    }

    // 1. Reassign array immutably so LWC re-renders the updated stock count
    this.medications = this.medications.map((item) =>
      item.id === medId ? { ...item, stock: item.stock - 1 } : item
    );

    // 2. Publish payload matching MedicationCartChannel fields
    const payload = {
      medicationId: selectedMed.id,
      medicationName: selectedMed.name,
      unitPrice: selectedMed.price,
      actionType: "ADD"
    };
    publish(this.messageContext, MEDICATION_CART_CHANNEL, payload);
  }

  handleClearCart() {
    // Restore original stock counts
    this.medications = INITIAL_MEDICATIONS.map((med) => ({ ...med }));

    // Broadcast CLEAR action to subscriber
    const payload = {
      medicationId: null,
      medicationName: null,
      unitPrice: null,
      actionType: "CLEAR"
    };
    publish(this.messageContext, MEDICATION_CART_CHANNEL, payload);
  }
}
