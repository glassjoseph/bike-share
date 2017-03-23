require "./spec/spec_helper"

RSpec.describe "A weather is created" do
	it "it exists" do
    weather = Weather.new
    expect(weather).to be_instance_of(Weather)
  end

  it "a weather with all attributes is saved in database" do
    time = Date.today
    Weather.create(id: 1, date: time, max_temperature: 30, mean_temperature: 20, min_temperature: 10, mean_humidity: 5, mean_visibility: 5, mean_wind_speed: 5, precipitation: 2)
    expect(Weather.count).to eq(1)
  end

  it "a weather with a duplicate date is not saved in database" do
    time = Date.today
    Weather.create(id: 2, date: time, max_temperature: 30, mean_temperature: 20, min_temperature: 10, mean_humidity: 5, mean_visibility: 5, mean_wind_speed: 5, precipitation: 2)
    expect(Weather.count).to eq(1)
  end

  it "a second weather with all attributes can be saved in database" do
    time = Date.yesterday
    Weather.create(id: 3, date: time, max_temperature: 30, mean_temperature: 20, min_temperature: 10, mean_humidity: 5, mean_visibility: 5, mean_wind_speed: 5, precipitation: 2)
    expect(Weather.count).to eq(2)
  end

end

# date:
# max_temperature:
# mean_temperature:
# min_temperature:
# mean_humidity:
# mean_visibility:
# mean_wind_speed:
# precipitation:
