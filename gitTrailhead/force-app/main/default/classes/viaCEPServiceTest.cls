@isTest
public class viaCEPServiceTest {
    @isTest
        static void getCep(){
        Test.setMock(HttpCalloutMock.class, new viaCEPServiceMock(200,'{"cep": "21073140","logradouro": "Avenida Darcy Bitencourt Costa","complemento": "","bairro": "Olaria","localidade": "Rio de Janeiro","uf": "RJ","ibge": "3304557","gia": "","ddd": "21","siafi": "6001"  }'));
        
        Test.startTest();
        HTTPResponse req = ViaCEPService.getAddressByCEP('21073140');
        Test.stopTest();
    }
}