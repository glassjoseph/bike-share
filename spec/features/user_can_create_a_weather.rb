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

    #
    # fill_in , with:
    # fill_in "station[name]", with: "Downtown"
    # fill_in "city[name]", with: "Amsterdam"
  	# fill_in "station[dock_count]", with: 15
  	# fill_in "station[installation_date]", with: time
  	click_on "Submit" #explore selectors
    expect( current_path ).to eq('/conditions')

  end

  it "then user can view the weather report" do
    # Date: time
    # Max Temperature: 30
    # Minimum Temperature: 20
    # Average Temperature: 10
    # Avg Humidity: 5
    # Average Visibility: 5
    # Wind Speed: 5
    # Precipitation: 2
  end


#   it "they can't submit when name field is empty" do
#     time = DateTime.now
#     visit '/stations/new'
#     fill_in "city[name]", with: "Amsterdam"
#     fill_in "station[dock_count]", with: 15
#     fill_in "station[installation_date]", with: time
#
#     click_on "Submit"
#
#     expect( current_path ).to eq('/stations/new')
#     expect(page).to have_content("Create a New Station")
#   end
#
#   it "they can't submit when city field is empty" do
#     time = DateTime.now
#     visit '/stations/new'
#     fill_in "station[name]", with: "Station 235"
#     fill_in "station[dock_count]", with: 15
#     fill_in "station[installation_date]", with: time
#
#     click_on "Submit"
#
#     expect( current_path ).to eq('/stations/new')
#     expect(page).to have_content("Create a New Station")
#   end
#
#   it "they can't submit when dock_count field is empty" do
#     time = DateTime.now
#     visit '/stations/new'
#     fill_in "station[name]", with: "Amsterdam"
#     fill_in "city[name]", with: "NYC"
#     fill_in "station[installation_date]", with: time
#
#     click_on "Submit"
#
#     expect( current_path ).to eq('/stations/new')
#     expect(page).to have_content("Create a New Station")
#   end
#
#   it "they can't submit when installation_date field is empty" do
#     time = DateTime.now
#     visit '/stations/new'
#     fill_in "station[name]", with: "Billy"
#     fill_in "city[name]", with: "Amsterdam"
#     fill_in "station[dock_count]", with: 15
#
#     click_on "Submit"
#
#     expect( current_path ).to eq('/stations/new')
#     expect(page).to have_content("Create a New Station")
#   end
#
#
end
