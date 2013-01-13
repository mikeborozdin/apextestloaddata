@isTest
public with sharing class TestAccountProcessor {

    public static testMethod void shouldReturnLastCreatedAccount() {  	
    	final String staticResourceName = 'TestAccountsCreatedDate';
    	
    	final Account[] testAccounts = (Account[]) Test.loadData(Account.sObjectType, staticResourceName);
    	
    	final Account lastCreatedAccount = AccountProcessor.getLastCreatedAccount();
    	
    	//checking our assumptions about input test data
    	System.assert(testAccounts[1].CreatedDate > testAccounts[0].CreatedDate);
    	//checking the method behaviour
    	System.assertEquals(testAccounts[1].Id, lastCreatedAccount.Id);
    }
    
    public static testMethod void shouldReturnLastModifiedAccount() {
        final String staticResourceName = 'TestAccountsLastModifiedDate';
        
        final Account[] testAccounts = (Account[]) Test.loadData(Account.sObjectType, staticResourceName);
        
        final Account lastModifiedAccount = AccountProcessor.getLastModifiedAccount();
        
        //checking our assumptions about input test data
        System.assert(testAccounts[1].LastModifiedDate > testAccounts[0].LastModifiedDate);
        System.assert(testAccounts[1].CreatedDate < testAccounts[0].CreatedDate);
        //checking the method behaviour
        System.assertEquals(testAccounts[1].Id, lastModifiedAccount.Id);
    }
}