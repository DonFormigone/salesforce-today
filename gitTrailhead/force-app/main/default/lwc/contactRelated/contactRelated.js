import { LightningElement, api, wire } from 'lwc';

import getByParentId from '@salesforce/apex/AccountController.getRecordByParentId';
import CONTACTNAME from '@salesforce/schema/Contact.Name'
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
const fields =[CONTACTNAME];


export default class ContactRelated extends LightningElement {
    @api recordId;
    @wire(getByParentId, {Id: '$recordId', fields}) 
    related;
    
    get name() {
        console.log('related: ' , this.recordId);
        console.log('related: ' , this.related);
        return this.related.data.fields.CONTACTNAME.value;
    }

}