({
    doInit : function(component, event, helper) {      
        var selectedAccount = component.find('selectedAccount').get("v.value");
        component.set("v.SelAcc",selectedAccount);
        //Used to get Accounts to show in Drop down
        var action = component.get("c.getLstAccounts");       
        action.setCallback(this,function(a){
            component.set("v.lstAccounts",a.getReturnValue());
        });      
        $A.enqueueAction(action);
    },
   
    onAccountChange : function(component, event, helper){       
        var selectedAccount = component.find('selectedAccount').get("v.value");
        component.set("v.SelAcc",selectedAccount);
       
        var myEvent = $A.get("e.c:accountContactEvent");
        myEvent.setParams({"selectedAccount" : selectedAccount}).fire();
    },
})