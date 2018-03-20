public class AccountContactClass {
 
    @AuraEnabled
    public static List<Account> getLstAccounts() {                      
        return [select id,Name from Account];
    }
   
    @AuraEnabled
    public static List<LineItem> getLstContact(String accountId) {
        List<LineItem> origLineItems = new List<LineItem>();           
        List<Contact> fshList = [select id,Name,Phone,Email,Account.Name,AccountID from contact where AccountID=:accountId];       
        if(fshList !=null){
            for(contact fsh: fshList){ 
                lineItem  li = new LineItem();
                li.lineId = fsh.id;                                                   
                li.Name  = fsh.Name;                               
                li.Phone = fsh.Phone;                
                li.Email = fsh.Email;
                li.AccountName = fsh.Account.Name;
                li.AccountIDs = fsh.AccountID;
                origLineItems.add(li);
            }           
        }
        return origLineItems;
    }
   
    @AuraEnabled
    public static List<LineItem> getSaveContacts(String accountName) {
        List<LineItem> origLineItems = new List<LineItem>();           
        List<Contact> fshList = [select id,Name,Phone,Email,Account.Name,AccountID from contact where Account.Name=:accountName];
        String AccID = fshList[0].AccountID;
        if(fshList !=null){
            for(contact fsh: fshList){ 
                lineItem  li = new LineItem();
                li.lineId = fsh.id;                                                   
                li.Name  = fsh.Name;                               
                li.Phone = fsh.Phone;                
                li.Email = fsh.Email;
                li.AccountName = fsh.Account.Name;
                li.AccountIDs = fsh.AccountID;
                origLineItems.add(li);
            }           
        }

        for (LineItem CU : origLineItems) {
   CU.Save();
  }
       
        return getLstContact(AccID);
    }
   
    public class LineItem{
        @AuraEnabled
        public String lineId {get;set;}
        @AuraEnabled
        public String Name {get;set;}
        @AuraEnabled
        public String Phone {get;set;}
        @AuraEnabled
        public String Email {get;set;}
        @AuraEnabled
        public String AccountName {get;set;}
        @AuraEnabled
        public String AccountIDs {get;set;}
       
        public void Save() {
            Contact c = [SELECT c.Email FROM Contact c WHERE c.ID = :lineId LIMIT 1];
            c.Email = Email;
            update c;
        }
    }
   
}