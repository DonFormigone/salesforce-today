import { LightningElement, wire } from 'lwc';
import getContactByParent from '@salesforce/apex/ContactExampleController.getContactByParent';

export default class ContactExample extends LightningElement {
@wire(getContactByParent)
wiredContacts({error, data}){
    if(data){
        this.contacts = data;
        this.error = undefined;
    } else if(error){
        this.error = error;
        this.contacts = undefined;
    }
}
}