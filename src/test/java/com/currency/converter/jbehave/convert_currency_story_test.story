Scenario: When client tries to convert currency from one form to the other
 
Given a user desires to convert currency
When client tries to convert the currency from EUR to USD with quantity as 100
Then user should be allowed to convert the currency