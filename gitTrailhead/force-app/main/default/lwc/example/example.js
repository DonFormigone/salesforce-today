import { LightningElement, track, wire } from 'lwc';
import { getRelatedListRecords } from 'lightning/uiRelatedListApi';
export default class Example extends LightningElement{
    @track records;
    error;
    @wire(getRelatedListRecords, {
        parentRecordId: '0034x00001D7ijRAAR',
        relatedListId: 'Contacts',
        fields: ['Contact.Id','Contact.Name'],
        where: "{ and: [{ Name: { like: \"Bob%\" }}] }"
    })listInfo({ error, data }) {
        if (data) {
            this.records = data.records;
            this.error = undefined;
            console.log('Abobrinha');
        } else if (error) {
            this.error = error;
            this.records = undefined;
        }
    }
}