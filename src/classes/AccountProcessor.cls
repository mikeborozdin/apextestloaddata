public with sharing class AccountProcessor {
    
    public static Account getLastCreatedAccount() {
    	return [Select
    	           Id
    	        From
    	           Account
    	        Order by
    	           CreatedDate Desc
    	        Limit
    	           1];
    }
    
    public static Account getLastModifiedAccount() {
        return [Select
                   Id
                From
                   Account
                Order by
                   LastModifiedDate Desc
                Limit
                   1];
    }
}