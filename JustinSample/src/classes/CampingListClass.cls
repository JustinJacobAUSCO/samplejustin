public with sharing class CampingListClass { 
    @AuraEnabled
    public static List<Camping_Item__c> getCampingItems() {
        return [SELECT Id, Name, Quantity__c, Price__c, Packed__c, 
                        CreatedDate 
                FROM Camping_Item__c];
    }
}