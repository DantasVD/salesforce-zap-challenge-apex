public class BuscaCepCallout {
    public string CEP{get;set;}

    public BuscaCepCallout(string CEP)
    {
        this.CEP = CEP;
    }
    public ViacepModel doCallout()
    {
        try 
        {
            HttpRequest req = new HttpRequest();
            req.setEndpoint('callout:BuscaCep/' + this.CEP + '/json/');
            req.setMethod('GET');
            Http http = new Http();
            HTTPResponse res = http.send(req);
            ViacepModel parsedResponse = ViacepModel.parse(res.getBody());
            
            return parsedResponse;
        }
        catch (Exception e)
        {
            ViacepModel response = new ViacepModel();
            response.erro = e.getMessage();
            System.debug(response);
            return response;
        }

    }
}
