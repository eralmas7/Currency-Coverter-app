Scenario: When users are added to the repository they must be found afterwards in the repository
 
Given a new user with email testnewuser@gmail.com password test1234!
When client tries to register the user
Then user with email testnewuser@gmail.com is allowed to register