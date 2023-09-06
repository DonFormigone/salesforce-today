import { LightningElement, api, wire, track } from 'lwc';
import getContactsList from '@salesforce/apex/ContactController.getContactList';

export default class ContactListbyAccountId extends LightningElement {
    @track recordId;
    @track contacts;

    @wire(getContactsList, {accountId: '$recordId'} )
    wireContacts({error, data}){
        if(data){
            this.contacts = data;
            this.error = undefined;
        }else{
            this.error = error;
            this.contacts = undefined;
        }
    }
}