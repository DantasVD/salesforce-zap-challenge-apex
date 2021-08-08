public with sharing class Accounts  extends fflib_SObjectDomain {
    

    public Accounts(List<Account> sObjectList) {
        super(sObjectList);
    }
    /*
    Padrão só para permitir a utilização de triggers na Domain necessário pois apex não possui possibilidade de termos reflection
    (identificação em runtime de classes para métodos e atributos ) 
    */

    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Accounts(sObjectList);
        }
    }

    public void saveViacepData(ViacepModel data, fflib_SObjectUnitOfWork uow)
    {
        for (Account acc : (List<Account>) Records) 
        {
            acc.BillingPostalCode =  data.cep;
            acc.BillingStreet =  data.logradouro;
            acc.BillingCity =  data.localidade;
            acc.BillingState =  data.uf;
            acc.Bairro__c =  data.bairro;
            acc.Complemento__c =  data.complemento;
            acc.ddd__c =  Decimal.valueOf(data.ddd);
            acc.ibge__c =  data.ibge;
            acc.gia__c =  data.gia;
            acc.siafi__c =  Decimal.valueOf(data.siafi);
            uow.registerDirty(acc);
            system.debug('accDomain: ' + acc);
        }
    }

}