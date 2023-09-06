public with sharing class ContactRelatedController {
    @AuraEnabled(cacheable=true)
    public static Contact getContactByParent(String accountId){
        Contact contact = ContactDAO.getByParentId(accountId);
        return contact;
    }
}