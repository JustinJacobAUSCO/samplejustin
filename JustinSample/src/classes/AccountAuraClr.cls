public class AccountAuraClr{
    public List<Contact> accdetailList{get;set;}
    @AuraEnabled
    public static List<Contact> getAccountsRelatedData(String AccId){
        List<Contact> accdetailList = [SELECT Id,Email,FirstName,LastName FROM Contact where AccountId =:AccId];
        return accdetailList;
    }
    @AuraEnabled
    public static List<Account> getAccounts(){
        List<Account> accountList = [Select Name,Id from Account where Type != null LIMIT  5];
        return accountList;
    }
   @AuraEnabled
     public static Event saveEvent( SObject eventObj ) {
     Event event = (Event) eventObj;
     upsert event;
     return event;
        
}
}