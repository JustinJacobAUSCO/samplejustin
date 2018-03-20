({
	doInit : function(component,event,helper) {
        
        var action = component.get("c.getAccounts");
        action.setParams({});
        
        action.setCallback(this, function(response){
            
          var state = response.getState();
            var result = response.getReturnValue();
           	if (state === "SUCCESS") {
                component.set("v.AccountList",result);
                
             }else if (state === "ERROR"){
            	//code for showToast functionality
                var toastEvent = $A.get("e.force:showToast");
                
                toastEvent.setParams({
                    "title": "Message!",
                    "message": "Error in fetching Accounts"
                });
                toastEvent.fire();
            }
          });
        
        $A.enqueueAction(action);
        
    },
    getDetails : function(component,event,helper) {
        var val = document.getElementById("AccList").value;
        var action1 = component.get("c.getAccountsRelatedData");
        action1.setParams({
            "AccId" : val
        });
        
        action1.setCallback(this, function(response){
            
          var state1 = response.getState();
            var result1 = response.getReturnValue();
           	if (state1 === "SUCCESS") {
                component.set("v.AccountDetail",result1);
                
             }else if (state1 === "ERROR"){
            	//code for showToast functionality
                var toastEvent = $A.get("e.force:showToast");
                
                toastEvent.setParams({
                    "title": "Message!",
                    "message": "Error in fetching details"
                });
                toastEvent.fire();
            }
          });
        
        $A.enqueueAction(action1);
        
    },
    save : function(component, event, helper) {
        try {
		component.find("edit").get("e.recordSave").fire();
            var toastEvent = $A.get("e.force:showToast");
                
                toastEvent.setParams({
                    "title": "Message!",
                    "message": "Record Saved Successfully"
                });
            
                toastEvent.fire();
                        
        }catch (e) {
    		console.log(e);
  			}
         location.reload();// This will refresh the app to get the latest updated data.        
    },
  /* save : function(component, event, helper) {
        var clickedButton = event.getSource(),
           eventRecordId = clickedButton.get("v.value");
       if(eventRecordId != null){
        var toastEvent = $A.get("e.force:showToast");
                
                toastEvent.setParams({
                    "title": "Message!",
                    "message": "Saved Successfully"
                });
                toastEvent.fire();
       },*/
        edit : function(component, event, helper) {
        //component.set("v.isView",false);
        component.set("v.isEdit",true);
        console.log('Edit record ID..'+event.target.id);
        component.set("v.editAccId",event.target.id);
        //component.set("v.viewAccId",event.target.id);
        
        
    },
    
    
    
      /* var navigateToSObject = $A.get("e.force:navigateToSObject");
       navigateToSObject.setParams({
           "recordId" : eventRecordId
           
       });*/
       
     //navigateToSObject.fire();
         //alert('hello'+eventRecordId);
        
    }
    

)