require "./spec/spec_helper"

RSpec.describe "As a user wants to create a conditions report" do
  time = DateTime.now
	it "they can enter weather attributes and see them on the page" do
		visit '/conditions/new'

	  expect( current_path ).to eq('/conditions/new')
	  expect(page).to have_content("Create a New Conditions Report")
  	expect(page).to have_content("Max Temperature:")
  	expect(page).to have_content("Minimum Temperature:")
  	expect(page).to have_content("Average Temperature:")
  	expect(page).to have_content("Avg Humidity:")
  	expect(page).to have_content("Average Visibility:")
  	expect(page).to have_content("Avg Wind Speed:")
  	expect(page).to have_content("Precipitation:")
  	expect(page).to have_content("Date:")
	end

  it "then user can submit weather conditions" do
    visit '/conditions/new'
    fill_in "weather[date]", with: time
    fill_in "weather[max_temperature]", with: 30
    fill_in "weather[min_temperature]", with: 20
    fill_in "weather[mean_temperature]", with: 10
    fill_in "weather[mean_humidity]", with: 5
    fill_in "weather[mean_visibility]", with: 5
    fill_in "weather[mean_wind_speed]", with: 5
    fill_in "weather[precipitation]" , with: 2

  	click_on "Submit"
    expect( current_path ).to eq('/conditions')

  end

  it "then user can view the weather report" do

  end

end
