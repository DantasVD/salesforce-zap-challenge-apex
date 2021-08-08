public class AccountsSelector extends fflib_SObjectSelector
{
    public Schema.SObjectType getSObjectType()
    {
        return Account.sObjectType;
    }
   
    public List<Schema.SObjectField> getSObjectFieldList()
    {
        return new List<Schema.SObjectField> 
        {
            Account.Id,
            Account.Name,
            Account.AccountNumber,
            Account.BillingPostalCode,
            Account.BillingStreet,
            Account.BillingCity,
            Account.BillingState,   
            Account.Bairro__c,
            Account.Complemento__c,
            Account.ddd__c,
            Account.ibge__c,
            Account.gia__c,
            Account.siafi__c
        };
    }


	public List<Account> selectById(Set<ID> idSet)
	{
		return (List<Account>) selectSObjectsById(idSet);
	}
}
