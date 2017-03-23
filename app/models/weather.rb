class Weather < ActiveRecord::Base

	validates :date, uniqueness: true
	has_many :trips, :foreign_key => :start_date
	def self.total
		all.count
	end


	def self.avg_rides

		Weather.find()

	end




	def self.sort_precip(range)
		array = Weather.where(precipitation: range).all.map {|weather| weather.date}
		trip_nums = array.map do |date|
			date = date.to_time.in_time_zone("UTC")
			Trip.where(start_date: date.beginning_of_day...date.end_of_day).count
		end
		return_hash = {}
		return_hash[:max] = trip_nums.sort.last
		return_hash[:min] = trip_nums.sort.first
		return_hash[:avg] = trip_nums.inject(:+) / trip_nums.length unless trip_nums.length == 0
		return_hash
	end

	def self.sort_temp(range)
		array = Weather.where(max_temperature: range).all.map {|weather| weather.date}
		trip_nums = array.map do |date|
			date = date.to_time.in_time_zone("UTC")
			Trip.where(start_date: date.beginning_of_day...date.end_of_day).count
		end
		return_hash = {}
		return_hash[:max] = trip_nums.sort.last
		return_hash[:min] = trip_nums.sort.first
		return_hash[:avg] = trip_nums.inject(:+) / trip_nums.length unless trip_nums.length == 0
		return_hash
	end
	def self.sort_wind(range)
		array = Weather.where(mean_wind_speed: range).all.map {|weather| weather.date}
		trip_nums = array.map do |date|
			date = date.to_time.in_time_zone("UTC")
			Trip.where(start_date: date.beginning_of_day...date.end_of_day).count
		end
		return_hash = {}
		return_hash[:max] = trip_nums.sort.last
		return_hash[:min] = trip_nums.sort.first
		return_hash[:avg] = trip_nums.inject(:+) / trip_nums.length unless trip_nums.length == 0
		return_hash
	end
	def self.sort_viz(range)
		array = Weather.where(mean_visibility: range).all.map {|weather| weather.date}
		trip_nums = array.map do |date|
			date = date.to_time.in_time_zone("UTC")
			Trip.where(start_date: date.beginning_of_day...date.end_of_day).count
		end
		return_hash = {}
		return_hash[:max] = trip_nums.sort.last
		return_hash[:min] = trip_nums.sort.first
		return_hash[:avg] = trip_nums.inject(:+) / trip_nums.length unless trip_nums.length == 0
		return_hash
	end


end
