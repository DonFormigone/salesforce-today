global class viaCEPServiceMock implements HttpCalloutMock {
    public String body {get; set;}
    public Integer statusCode {get; set;}

    public viaCEPServiceMock(Integer statusCode,String body){
        this.body = body;
        this.statusCode = statusCode;
    }
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody(this.body);
        response.setStatusCode(this.statusCode);
        return response; 
    }
}

