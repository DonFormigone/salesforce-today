public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [
            SELECT Name, AnnualRevenue, Industry
            FROM Account
            WITH SECURITY_ENFORCED
            ORDER BY Name
        ];
    }
    @AuraEnabled(cacheable=true)
    public static Contact getRecordByParentId(String Id){
        Contact contactRelated = ContactDAO.getByParentId(id);
        return contactRelated;
    }
}