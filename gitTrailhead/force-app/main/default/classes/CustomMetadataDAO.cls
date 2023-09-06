public with sharing class CustomMetadataDAO {
        public static Webservice__mdt getEndpoint(String serviceName){
            Webservice__mdt endpoint = [SELECT ID, URL__C, isActive__c FROM Webservice__mdt WHERE isActive__c = true AND DeveloperName =:serviceName]; 
            return endpoint;
        }
}