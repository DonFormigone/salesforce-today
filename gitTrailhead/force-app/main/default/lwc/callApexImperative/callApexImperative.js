import { LightningElement, api, wire } from 'lwc';
import { reduceErrors } from 'c/ldsUtils';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
export default class CallApexImperative extends LightningElement {
    @api recordId;
    errors;
    handleButtonClick() {
        getRelatedContacts({
            accountId: this.recordId
        })
            .then(contacts => {
                // code to execute if the promise is resolved
            })
            .catch(error => {
                this.errors = reduceErrors(error); // code to execute if the promise is rejected
            });
    }
}