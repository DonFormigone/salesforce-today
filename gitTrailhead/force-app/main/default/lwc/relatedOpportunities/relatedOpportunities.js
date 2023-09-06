import { LightningElement, api, wire } from 'lwc';
import loadOpportunities from '@salesforce/apex/OpportunityController.getOpportunity';

export default class RelatedOpportunities extends LightningElement {
    @api recordId;
    @wire(loadOpportunities,{accountId: '$recordId'})
    wireOpportunies({error, data}){
        if(error){
            console.log('error');
            console.dir(error);
        }else if (data){
            console.log('data');
            console.dir(data);
        }
    }
}