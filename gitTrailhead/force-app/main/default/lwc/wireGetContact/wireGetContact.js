import { LightningElement, wire } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';
export default class WireGetContact extends LightningElement {
    @wire(getContactList) contacts;
    wiredContacts({
        error,
        data
    }) 
    {

        if (data) {
            this.contacts = data;
            console.log(data);
            console.log(JSON.stringify(data, null, '\t'));
            
            data.forEach(function (item, key) {
                console.log(key); 
                console.log(item); 
            });
            
        } else if (error) {
            this.error = error;
        }
    }
}