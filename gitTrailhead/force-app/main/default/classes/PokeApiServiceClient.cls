public with sharing class PokeApiServiceClient {
    public static void getPokemon(String pokeName){
        Http http = new Http();
    HttpRequest request = new HttpRequest();
    String pokemonName = pokeName.toLowerCase();
    System.debug('pokemonName: '+pokemonName);
    request.setEndpoint('https://pokeapi.co/api/v2/pokemon/'+ pokemonName);
    request.setMethod('GET');
    HttpResponse response = http.send(request);
    // If the request is successful, parse the JSON response.
    if(response.getStatusCode() == 200) {
        ServiceLogController.createLog(request, response, 'getPokemon');
}
    }
}