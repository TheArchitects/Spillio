Feature: Login to Spillio
    As a student or instructor
    I want to use my Calnet credentials in the system
    So that the system can identify me.

Background: I am on the Spillio home page

	Given I am on the "home" page
	Then I should see a "Log in" button

Scenario: Redirectiong to facebook Login page

	When I follow "Log in" link
	Then I should be on the "facebook" page

Scenario: Sign in without password

	When I follow "Log in" link
	And I fill in "username" with "this is not an id"
	Then I should see "Passphrase is a required field." on the page

Scenario: Sign in using not a valid Password

	When I follow "Log in" link
	And I fill in "username" with "this is not an id"
	And I fill in "password" with "some password"
	Then I should see "The CalNet ID and/or Passphrase you provided are incorrect." on the page

Scenario: Sign in using a valid Password first time user

	When I follow "Log in" link
	And I fill in "username" with "validUserName"
	And I fill in "password" with "validPassword"
	And I am a first time visitor
	Then I should be on the "create_user_profile" page or on the "user_profile" page 

