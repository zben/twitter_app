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
    page.should have_css('li', text: /#{keyword}/, count: 10)
  end
end
