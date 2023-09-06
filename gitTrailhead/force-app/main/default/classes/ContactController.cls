public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [
            SELECT
                Id,
                Name,
                FirstName,
                LastName,
                Title,
                Phone,
                Email
            FROM Contact
            WHERE Name != NULL
            WITH SECURITY_ENFORCED
            LIMIT 10
        ];
    }

    @AuraEnabled(cacheable=true)
    public static Contact getContactsList(String accountId) {
       System.debug('###Parametro: ' + accountId);
        return [
            SELECT
                Id,
                Name,
                FirstName,
                LastName,
                Title,
                Phone,
                Email
            FROM Contact
            WHERE AccountId = :accountId
            WITH SECURITY_ENFORCED
            LIMIT 10
        ];
    }
    
    @AuraEnabled(cacheable=true)
    
    public static List<Contact> getContacts(){
        // return [SELECT FirstName, LastName, Email 
        // FROM CONTACT
        // WITH SECURITY_ENFORCED
        // ORDER BY FirstName];
        throw new AuraHandledException('Forced error');
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> findContacts(String searchKey) {
        String key = '%' + searchKey + '%';
        return [
            SELECT Id, Name, Title, Phone, Email
            FROM Contact
            WHERE Name LIKE :key
            WITH SECURITY_ENFORCED
            LIMIT 10
        ];
    }
}