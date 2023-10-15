public with sharing class CalloutService {
    public static String connect(String serviceName){
            Webservice__mdt endpoint = new Webservice__mdt(); 
            endpoint = CustomMetadataDAO.getEndpoint(serviceName);
            return endpoint.URL__C;
    }
    public static void setError(HttpRequest request, HttpResponse response, String apiName){
            ServiceLog__c serviceLog = new ServiceLog__c();  
            Integer totalCharacter = 0;
            Integer maxCharacter = 131072;
            totalCharacter = totalCharacter + response.getBody().length();
        
            if (totalCharacter > maxCharacter) {
                serviceLog.Information__c = 'Response JSON maior que o permitido, verifique no seu Log da plataforma';
            }
        
            serviceLog.Name = request.getMethod() +' ' + apiName + ' ' + System.Date.today();
            serviceLog.Method__c = request.getMethod();
            serviceLog.Endpoint__c = request.getEndpoint();
            serviceLog.StatusCode__c = String.valueOf(response.getStatusCode());
            String responseLimited = (totalCharacter > maxCharacter ? response.getBody().left(131071) : response.getBody());
            serviceLog.Response__c = responseLimited; 
            serviceLog.Request__c = String.valueOf(request);
            Database.insert(serviceLog);
    }
}