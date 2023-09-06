public with sharing class ServiceReaderController {
   public static void createLog(HttpRequest request, HttpResponse response, String apiName){
    Service_Reader__c serviceReader = new Service_Reader__c();  
    Integer totalCharacter = 0;
    Integer maxCharacter = 131072;
    totalCharacter = totalCharacter + response.getBody().length();

    if (totalCharacter > maxCharacter) {
        serviceReader.Information__c = 'Response JSON maior que o permitido, verifique no seu Log da plataforma';
    }

    serviceReader.Name = request.getMethod() +' ' + apiName + ' ' + System.Date.today();
    serviceReader.Method__c = request.getMethod();
    serviceReader.Endpoint__c = request.getEndpoint();
    serviceReader.Status_Code__c = String.valueOf(response.getStatusCode());
    String responseLimited = (totalCharacter > maxCharacter ? response.getBody().left(131071) : response.getBody());
    serviceReader.Response__c = responseLimited; 
    serviceReader.Request__c = String.valueOf(request);
    Database.insert(serviceReader);

   }
   @AuraEnabled
   public static List<Service_Reader__c> getServiceReader(){
    List<Service_Reader__c> reader = ServiceReaderDAO.getListRecord();
    return reader;
   }
   @AuraEnabled
   public static Service_Reader__c getServiceReaderById(String id){
    Service_Reader__c reader = ServiceReaderDAO.getRecordById(id);
    return reader;
   }

   
}