public with sharing class AccountController1 {
@AuraEnabled
    public String selectedAccId{get;set;}
          
           public List<SelectOption> getAccountNames() {
                  List<SelectOption> accOptions= new List<SelectOption>();
                  accOptions.add( new SelectOption('','--Select--'));
                  for( Account acc : [select Id,name from Account limit 5 ] ) {
                          accOptions.add( new SelectOption(acc.Id,acc.name)); /*SelectOption list takes two parameters one is value and other one is label .In this case account name as a label and Id is the value .*/
                  }
                 return accOptions;
           }
    }