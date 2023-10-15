import { LightningElement, wire, api } from 'lwc';
import getAdress from '@salesforce/apex/SearchAddressController.getAddressByCEP';
import getRecord from '@salesforce/apex/SearchAddressController.getRecord';

export default class SearchAddressLWC extends LightningElement {
    @api recordId;
    @api cepvalue;
    @api returnAddress;
    @api account
    @api error;
    showError;

    handleEmail(event){
        this.cepvalue = event.target.value;
    }
    handleClick(){
        alert('RecordId:  ' + this.recordId);
        this.searchAddress();
    }

    async getAccount() {
        try {
            this.account = await getRecord({ recordId: this.recordId });
            this.error = undefined;
            console.log('account: ### ' + this.account);
        } catch (error) {
            this.error = error;
            this.account = undefined;
        }
    }

    async searchAddress() {
        try {
            this.returnAddress = await getAdress({ cep: this.cepvalue, recordId: this.recordId });
            this.error = undefined;
            console.log('returnAddress: ### ' + JSON.stringify(this.returnAddress));
        } catch (error) {
            this.error = error;
            this.returnAddress = undefined;
        }
    }
}