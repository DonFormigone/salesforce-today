public with sharing class ContactDAO {

    public static Contact getContactById(String contactId){
        return [SELECT Id, Name, Phone, AccountId FROM Contact WHERE Id =:contactId];
    }
    public static Contact getByParentId(String id){
        List<Contact> contactList = [SELECT Id,Name, Title, Phone, MobilePhone,Email, AccountId FROM Contact WHERE AccountId =:id];
        if(!contactList.isEmpty()){
            return contactList[0];
        }
        return null; 
    }

}