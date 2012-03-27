Feature: Search Twitter
	In order to 
	As a user
	I should be able to create a search and see related tweets
	
	@real-twitter
	Scenario: Submit a search through URL
		Given I am on the homepage
		When I search "rails"
		Then I should see tweets that contain "#rails"
	
	@javascript
	Scenario: Submit an ajax search through form
		Given I am on the homepage
		When I search "rails" in the form
		Then I should see tweets that contain "#rails"
		
	Scenario: Search Twitter with known results
		Given Twitter responds to the search "#rails" with the tweets:
			|text						|
			|#rails is amazing			|
			|I love #rails				|
			|#rails is  cool, but #backbone is cooler|
			|I like #rails				|
		And Twitter responds to the search "#ruby" with the tweets:
			|text|
			|#ruby is pretty great |
		When I search "rails"
		Then I should see the following tweets:
			|#rails is amazing			|
			|I love #rails				|
			|#rails is  cool, but #backbone is cooler|
			|I like #rails				|
		But I should not see the following tweets:
			|#ruby is pretty great |