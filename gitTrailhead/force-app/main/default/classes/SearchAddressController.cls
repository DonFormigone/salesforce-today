public with sharing class SearchAddressController {
@AuraEnabled
public static Account getRecord(String recordId){
    try {
        Account acc = AccountDAO.getById(recordId);
        return acc;
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
}

@AuraEnabled
public static Account getAddressByCEP(String cep, String recordId){
    try {
        ViaCEPDTO addressDTO = ViaCEPService.getAddressByCEP(cep);
        Account acc = AccountDAO.getById(recordId);
        Account address = AccountUtil.updateAddress(addressDTO, acc);
        return address;
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
}
}