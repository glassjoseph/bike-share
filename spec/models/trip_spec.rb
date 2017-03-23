require "./spec/spec_helper"

RSpec.describe "A trip is created" do
	it "it exists" do
    trip = Trip.new
    expect(trip).to be_instance_of(Trip)
  end

  it "a created trip is saved in database" do
    time = DateTime.now
    station1 = Station.create(name: "Cloudbank", dock_count: 10, city_id: 1, installation_date: time)
    station2 = Station.create(name: "Bastion", dock_count: 1, city_id: 1, installation_date: time)

    Trip.create(id: 100, duration: 174, start_date: "2013-08-29 09:08:00", start_station: station1, end_date: "2013-08-29 09:11:00", end_station: station2, bike_id: 288, subscription_type: "Subscriber", zip_code: "94114")

    expect(Trip.count).to eq(1)
  end


  it "a trip without a duration is not saved in database" do
    time = DateTime.now
    station1 = Station.create(name: "Cloudbank", dock_count: 10, city_id: 1, installation_date: time)
    station2 = Station.create(name: "Bastion", dock_count: 1, city_id: 1, installation_date: time)

    Trip.create(id: 1, start_date: "2013-08-29 09:08:00", start_station: station1, end_date: "2013-08-29 09:11:00", end_station: station2, bike_id: 288, subscription_type: "Subscriber", zip_code: "94114")
    expect(Trip.count).to eq(1)
  end

  it "a trip without a start_date is not saved in database" do
    time = DateTime.now
    station1 = Station.create(name: "Cloudbank", dock_count: 10, city_id: 1, installation_date: time)
    station2 = Station.create(name: "Bastion", dock_count: 1, city_id: 1, installation_date: time)

    Trip.create(id: 2, duration: 174, start_station: station1, end_date: "2013-08-29 09:11:00", end_station: station2, bike_id: 288, subscription_type: "Subscriber", zip_code: "94114")
    expect(Trip.count).to eq(1)
  end

  it "a trip without a start_station is not saved in database" do
    time = DateTime.now
    station1 = Station.create(name: "Cloudbank", dock_count: 10, city_id: 1, installation_date: time)
    station2 = Station.create(name: "Bastion", dock_count: 1, city_id: 1, installation_date: time)

    Trip.create(id: 3, duration: 174, start_date: "2013-08-29 09:08:00", end_date: "2013-08-29 09:11:00", end_station: station2, bike_id: 288, subscription_type: "Subscriber", zip_code: "94114")
    expect(Trip.count).to eq(1)
  end

  it "a trip without a end_date is not saved in database" do
    time = DateTime.now
    station1 = Station.create(name: "Cloudbank", dock_count: 10, city_id: 1, installation_date: time)
    station2 = Station.create(name: "Bastion", dock_count: 1, city_id: 1, installation_date: time)

    Trip.create(id: 4, duration: 174, start_date: "2013-08-29 09:08:00", start_station: station1, end_station: station2, bike_id: 288, subscription_type: "Subscriber", zip_code: "94114")
    expect(Trip.count).to eq(1)
  end

  it "a trip without a end_station is not saved in database" do
    time = DateTime.now
    station1 = Station.create(name: "Cloudbank", dock_count: 10, city_id: 1, installation_date: time)
    station2 = Station.create(name: "Bastion", dock_count: 1, city_id: 1, installation_date: time)

    Trip.create(id: 5, duration: 174, start_date: "2013-08-29 09:08:00", start_station: station1, end_date: "2013-08-29 09:11:00", bike_id: 288, subscription_type: "Subscriber", zip_code: "94114")
    expect(Trip.count).to eq(1)
  end

  it "a trip without a bike_id is not saved in database" do
    time = DateTime.now
    station1 = Station.create(name: "Cloudbank", dock_count: 10, city_id: 1, installation_date: time)
    station2 = Station.create(name: "Bastion", dock_count: 1, city_id: 1, installation_date: time)

    Trip.create(id: 6, duration: 174, start_date: "2013-08-29 09:08:00", start_station: station1, end_date: "2013-08-29 09:11:00", end_station: station2, subscription_type: "Subscriber", zip_code: "94114")
    expect(Trip.count).to eq(1)
  end

  it "a trip without a subscription_type is not saved in database" do
    time = DateTime.now
    station1 = Station.create(name: "Cloudbank", dock_count: 10, city_id: 1, installation_date: time)
    station2 = Station.create(name: "Bastion", dock_count: 1, city_id: 1, installation_date: time)

    Trip.create(id: 7, duration: 174, start_date: "2013-08-29 09:08:00", start_station: station1, end_date: "2013-08-29 09:11:00", end_station: station2, bike_id: 288, zip_code: "94114")
    expect(Trip.count).to eq(1)
  end

  it "a second created trip is saved in database" do
    time = DateTime.now
    station1 = Station.create(name: "Cloudbank", dock_count: 10, city_id: 1, installation_date: time)
    station2 = Station.create(name: "Bastion", dock_count: 1, city_id: 1, installation_date: time)

    Trip.create(id: 101, duration: 174, start_date: "2013-08-29 09:08:00", start_station: station1, end_date: "2013-08-29 09:11:00", end_station: station2, bike_id: 288, subscription_type: "Subscriber", zip_code: "94114")
    expect(Trip.count).to eq(2)
  end


end


# duration
# start_date
# start_station
# end_date
# end_station
# bike_id
# subscription_type
