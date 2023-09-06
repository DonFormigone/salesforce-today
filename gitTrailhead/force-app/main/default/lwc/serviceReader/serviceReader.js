import { LightningElement, api, wire } from 'lwc';
import getServiceReaderById  from '@salesforce/apex/ServiceReaderController.getServiceReaderById'
import getListRecord from '@salesforce/apex/ServiceReaderController.getServiceReader'
export default class ServiceReader extends LightningElement {
    @api recordId;
    @wire(getListRecord) readers;
    wiredReader({error,data}){
        if(data){
            this.readers = data;
            this.error = undefined;
        } else if(error){
            this.error = error;
            this.readers = undefined;
        }
    } 
}