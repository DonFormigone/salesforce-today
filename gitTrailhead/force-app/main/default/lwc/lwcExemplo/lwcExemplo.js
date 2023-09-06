import { LightningElement, api, wire } from 'lwc';
import getContactByParent from '@salesforce/apex/ContactRelatedController.getContactByParent';
export default class MyComponent extends LightningElement {
    @api recordId;

}