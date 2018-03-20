({
    init : function(component, event, helper) {
        console.log('init');
        var action2 = component.get("c.getAccount");        
        action2.setCallback(this, function(response) {
            console.log(response.getReturnValue());
            component.set("v.account", response.getReturnValue());
        });
        $A.enqueueAction(action2);
    }, 
    save : function(component, event, helper) {
        console.log('save:1');
        var clickedButton = event.getSource(),
        eventRecordId = clickedButton.get("v.value");
        var action = component.get("c.saveAccount");
        var account = component.get("v.account");
        action.setParams({"account": account});
        action.setCallback(this, function() { 
            var toastEvent = $A.get("e.force:showToast");
                
                toastEvent.setParams({
                    "title": "Message!",
                    "message": "Saved Successfully"
                });
                toastEvent.fire();
            
            
            console.log('SAVED.');  } );
        $A.enqueueAction(action);
        console.log('save:end');
    },
})