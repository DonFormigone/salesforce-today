public with sharing class AccountDAO {
    public static Account getById(String id){
        return [SELECT Id, BillingStreet,BillingCity FROM Account WHERE Id =: id];
    }
}