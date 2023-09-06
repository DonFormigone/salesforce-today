@isTest
public with sharing class AccountExampleTest {
   @isTest
   public static void testAssert(){
    String name = 'Luis';
    
    Test.startTest();
        System.assertEquals('Luis', name);
        System.assertEquals('luis', name, 'String não corresponde ao parametro informado');
    Test.stopTest();
   }
}