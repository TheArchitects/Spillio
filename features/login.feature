Feature: Login to Spillio
    As a student or instructor
    I want to use my Calnet credentials in the system
    So that the system can identify me.

Background: I am on the Spillio home page

	Given I am on the "Spillio home" page
	And I am not logged in
	Then I should see a "sign in" button

Scenario: Redirectiong to CalNet Login page

	When I press "sign in" button
	Then I should be on the "CalNet Login" page

Scenario: Sign in without password

	When I press "sign in" button
	And I enter "this is not an id" as username
	Then I should see "Passphrase is a required field." on the page

Scenario: Sign in using not a valid Password

	When I press "sign in" button
	And I enter "this is not an id" as username
	And I enter "some password" as password
	Then I should see "The CalNet ID and/or Passphrase you provided are incorrect." on the page


Scenario: Sign in using a valid Password

	When I press "sign in" button
	And I enter "validUserName" as username
	And I enter "validPassword" as password
	Then I should be on the "Create User Profile" page
	Then I should be on the "User Profile" page
