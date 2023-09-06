@RestResource(urlMapping='/casemanage/*')
global without sharing class CaseIntegrationRest {
     @HttpGet
     global static List<Case> getCase(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountNumber = req.params.get('accountNumber');
        System.debug('accountNumber: ' + accountNumber);
        List<Case> lCase = [SELECT ID, Origin, ContactEmail, Priority   FROM CASE WHERE Account.AccountNumber =: accountNumber];
        System.debug('lCase: '+ lCase);

        return lCase;
    }
}