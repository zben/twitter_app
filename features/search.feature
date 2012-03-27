Feature: Search Twitter
	In order to 
	As a user
	I should be able to create a search and see related tweets
	
	Scenario: Submit a search through URL
		Given I am on the homepage
		When I search "rails"
		Then I should see tweets that contain "#rails"
	
	@javascript
	Scenario: Submit an ajax search through form
		Given I am on the homepage
		When I search "rails" in the form
		Then I should see tweets that contain "#rails"