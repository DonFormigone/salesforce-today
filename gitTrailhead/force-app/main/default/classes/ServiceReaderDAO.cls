public with sharing class ServiceReaderDAO {
    public static List<Service_Reader__c> getListRecord(){
        System.debug('#####' + 'Teste de deploy');
        return [SELECT ID, NAME, Method__c, Status_Code__c, Response__c, Request__c FROM Service_Reader__c LIMIT 1];
    }
    public static Service_Reader__c getRecordById(String id){
        return [SELECT ID, NAME, Method__c, Status_Code__c, Response__c, Request__c FROM Service_Reader__c WHERE Id = :id];
    }
}