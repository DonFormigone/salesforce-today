import { LightningElement, api, track, wire } from 'lwc';
import protocol from '@salesforce/schema/Protocol__c';
export default class AudioPlayerLWC extends LightningElement {
    @api recordId;
    @api musicPoster;
    @api musicFile;

    musicFile = 'https://www.computerhope.com/jargon/m/example.mp3';    
}