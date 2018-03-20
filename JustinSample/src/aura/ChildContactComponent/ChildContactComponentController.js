({   
    doInit : function(component, event, helper) {      
        var selectedAccount = component.get("v.selectedAccount");
       
        var action = component.get("c.getLstContact");
        action.setParams({
            "accountId" : selectedAccount
        });       
        action.setCallback(this,function(a){
            component.set("v.object",a.getReturnValue());
        });       
        $A.enqueueAction(action);
    },
   
    updateEvent : function(component, event, helper) {
        var selectedAccount = event.getParam("selectedAccount");
       
        var action = component.get("c.getLstContact");
        action.setParams({
            "accountId" : selectedAccount
        });       
        action.setCallback(this,function(a){
            component.set("v.object",a.getReturnValue());
        });       
        $A.enqueueAction(action);
    },
   
    SaveButton : function(component, event, helper) {
        var selectedAccount = component.find("AccountName");      
        var action = component.get("c.getSaveContacts");
        action.setParams({
            "accountName" : selectedAccount[0].get("v.value")
        });       
        action.setCallback(this,function(a){
            component.set("v.object",a.getReturnValue());
        });       
        $A.enqueueAction(action);
    }  
})