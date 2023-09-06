public with sharing class ContactExampleController {
   @AuraEnabled
public static Contact getContactByParent(String accountId){
    Contact contact = ContactDAO.getByParentId(accountId);
    return contact;
}
}