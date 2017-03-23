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

  it "a multiple trips are saved in database" do
    time = DateTime.now
    station1 = Station.create(name: "Cloudbank", dock_count: 10, city_id: 1, installation_date: time)
    station2 = Station.create(name: "Bastion", dock_count: 1, city_id: 1, installation_date: time)

    Trip.create(id: 101, duration: 174, start_date: "2013-08-29 09:08:00", start_station: station1, end_date: "2013-08-29 09:11:00", end_station: station2, bike_id: 288, subscription_type: "Subscriber", zip_code: "94114")

    Trip.create(id: 102, duration: 1740, start_date: "2013-08-29 09:08:00", start_station: station1, end_date: "2015-08-29 09:11:00", end_station: station2, bike_id: 288, subscription_type: "Subscriber", zip_code: "94114")

    Trip.create(id: 103, duration: 2, start_date: "2013-08-30 09:08:00", start_station: station1, end_date: "2013-08-30 09:11:00", end_station: station2, bike_id: 7, subscription_type: "Subscriber", zip_code: "94114")

    expect(Trip.count).to eq(4)
  end

  it "a trip can show avg" do
    expect(Trip.avg).to eq(522.5)
  end

  it "a trip can show longest" do
    expect(Trip.longest).to eq(1740)
  end

  it "a trip can show shortest" do
    expect(Trip.shortest).to eq(2)
  end

  it "a trip can show most_start" do
    expect(Trip.most_start).to eq("Cloudbank")
  end

  it "a trip can show most_end" do
    expect(Trip.most_end).to eq("Bastion")
  end

  it "a trip can show by_month" do
    expect(Trip.by_month[:months][8]).to eq(4)
    expect(Trip.by_month[:years][2013]).to eq(4)
  end

  it "a trip can show busiest_bike" do
    expect(Trip.busiest_bike).to eq({288=>3})
  end

  it "a trip can show least_busy_bike" do
    expect(Trip.least_busy_bike).to eq({7=>1})
  end

  it "a trip can show subscription_info" do
    expect(Trip.subscription_info).to eq({:customers=>0, :subscribers=>4, :customers_percentage=>0.0, :subscribers_percentage=>100.0})
  end

  it "a trip can show busiest_day" do
    expect(Trip.busiest_day[0].to_s).to eq("2013-08-29 00:00:00 UTC")
  end

  it "a trip can show least_busy_day" do
    expect(Trip.least_busy_day[0].to_s).to eq("2013-08-30 00:00:00 UTC")
  end

end


# duration
# start_date
# start_station
# end_date
# end_station
# bike_id
# subscription_type
