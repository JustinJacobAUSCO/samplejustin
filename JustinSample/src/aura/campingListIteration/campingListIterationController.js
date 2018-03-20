({       
doInit: function(component, event, helper) {
    var action = component.get("c.getCampingItems");
    action.setCallback(this, function(response) {
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            component.set("v.campingArray", response.getReturnValue());
        }
        else {  console.log("Failed with state: " + state);  }
    });
    $A.enqueueAction(action);
}    
})