public with sharing class AccountUtil {
    public static Account updateAddress(ViaCEPDTO address, Account record){
       
        record.BillingStreet = address.logradouro;
        record.BillingCity = address.localidade;
        record.BillingState = address.uf;
        return record;
    }
}