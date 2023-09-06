public with sharing class CalloutService {
    public static String connect(String serviceName){
            Webservice__mdt endpoint = new Webservice__mdt(); 
            endpoint = CustomMetadataDAO.getEndpoint(serviceName);
            return endpoint.URL__C;
    }
    public static void setError(String serviceName, String body, String error, String endpoint, String statusCode){
        Service_Reader__c sr = new Service_Reader__c();
        sr.Name = serviceName + System.Date.today();
        Endpoint__c = endpoint; 
        Method__c = ; 
        Status_Code__c = ; 
        Response__c = ; 
        Request__c = ;
        Information__c = ;
    }
}

String datetime = System.Date.Now();