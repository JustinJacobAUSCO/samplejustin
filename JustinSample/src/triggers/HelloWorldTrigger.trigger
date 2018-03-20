trigger HelloWorldTrigger on Account (before insert) {
    for(Account a:trigger.new){
        
        a.description='New description';
    }
//system.debug('Hello World');
}