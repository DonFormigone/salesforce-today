public with sharing class ViaCEPService {
    public static ViaCEPDTO  getAddressByCEP(String cep){
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    String endpoint = CalloutService.connect('ViaCEP');
    request.setEndpoint(endpoint.replace('{CEP}', cep));
    request.setMethod('GET');
    HttpResponse response = http.send(request);
    System.debug('String.valueOf(response)@@@' + String.valueOf(response.getBody()));
    ViaCEPDTO dto = (ViaCEPDTO)JSON.deserialize(String.valueOf(response.getBody()), ViaCEPDTO.class);
    System.debug(dto);
    return dto;
    }
}



