public with sharing class AccountController {
    public List<Account> acc = new List<Account>();
  @AuraEnabled(cacheable=true)
  public static List<Account> getAllActiveAccounts() {
    return [SELECT Id,Name,Phone,Type, Active__c FROM Account]; // Adding a comment
  }
    @AuraEnabled
    public static string updateAccounts(object data){
       List<Account> lstAccts = (List<Account>) JSON.deserialize(JSON.serialize(data), List<Account>.class);
       try {
        update lstAccts;
        return 'Success: contacts updated successfully';
    }
    catch (Exception e) {
        return 'The following exception has occurred: ' + e.getMessage();
    } 
    }
}