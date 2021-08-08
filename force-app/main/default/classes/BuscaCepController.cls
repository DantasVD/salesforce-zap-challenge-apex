public with sharing class BuscaCepController {
    public class RetornoComponente
    {
        public string message;
        public ViacepModel viacepModel;

        public string errorMessage;
        public boolean hasError;
        public RetornoComponente()
        {
            this.message = '';
            this.viacepModel = null;
            this.errorMessage = '';
            this.hasError = true;
        }
        

    }

    @AuraEnabled
    public static string doCallout(String cepBusca){
        RetornoComponente retorno = new RetornoComponente();
        BuscaCepCallout callout = new BuscaCepCallout(cepBusca);
        ViacepModel response = callout.doCallout();
        System.debug('response: ' + response);
        if(response.erro == null )
        {
            retorno.hasError = false;
            retorno.message = 'Success';
            retorno.errorMessage = '';
            retorno.viacepModel = response;
            system.debug('Retorno: ' + retorno);
            return JSON.serialize(retorno);
        }

        retorno.hasError = true;
        retorno.errorMessage = response.erro;
        retorno.message = '';
        system.debug('Retorno erro: ' + retorno);
        
        return JSON.serialize(retorno);
    }

    @AuraEnabled
    public static void saveData(string viacepModelData, string recordId){
        try 
        {   
            system.debug('entrou saveData: ');
            ViacepModel model = ViacepModel.parse(viacepModelData);
            system.debug('saveData: ' + model);
            AccountService.saveViacepData(model, new Set<Id>{recordId});

        } 
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
