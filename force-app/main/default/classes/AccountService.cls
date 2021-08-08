public class AccountService {
    public static void saveViacepData(ViacepModel data, Set<Id> accIds) 
    {
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork( new Schema.SObjectType[] { Account.SObjectType } );
        AccountsSelector selector = new AccountsSelector();
        List<Account> accs = selector.selectById(accIds);
        Accounts accsDomain = new Accounts(accs);
        accsDomain.saveViacepData(data, uow);
        uow.commitWork();
        system.debug('pos commit: ');
    }
}
