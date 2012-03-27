Given /^I am on the homepage$/ do
  visit "/"
end

When /^I search "([^"]*)"$/ do |keyword|
  visit "/#{keyword}"
end

When /^I search "([^"]*)" in the form$/ do |keyword|
  fill_in "Keyword", with: keyword
  click_button "Search"

end

Then /^I should see tweets that contain "([^"]*)"$/ do |keyword|
  within 'ul.tweets' do
    page.should have_css('li', text: /#{keyword}/i, count: 10)
  end
end

Given /^Twitter responds to the search "([^"]*)" with the tweets:$/ do |keyword, table|
  TwitterMock.stub_search_response(keyword, table.hashes)
end


Then /^I should see the following tweets:$/ do |table|
  tweets_text = table.raw.flatten
  tweets_text.each do |text|
    page.should have_css('ul.tweets li', text: text)
  end
end

Then /^I should not see the following tweets:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end
