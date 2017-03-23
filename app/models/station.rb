class Station < ActiveRecord::Base
  has_many :trips


	validates :name, presence: true
	validates :dock_count, presence: true
	validates :city_id, presence: true
	validates :installation_date, presence: true

  def self.total
    all.count
  end

  def self.avg
    self.average(:dock_count).round(1).to_f
  end

  def self.most_bikes
    self.where(dock_count: self.maximum(:dock_count)).first
  end

  def self.least_bikes
    self.where(dock_count: self.minimum(:dock_count)).first
  end

  def self.newest_station
    self.where(installation_date: self.maximum(:installation_date)).first
  end

  def self.oldest_station
    self.where(installation_date: self.minimum(:installation_date)).first
  end

  def self.most_popular_date(id)
    unless Trip.where(start_station_id: id).empty?
      Trip.where(start_station_id: id).group("DATE_TRUNC('day', start_date)").order('count_id DESC').limit(1).count(:id).flatten.to_s.to_date
    end
  end
  def self.most_popular_customer_zip(id)
    unless Trip.where(start_station_id: id).empty?
      Trip.where(start_station_id: id).group(:zip_code).order('count_id DESC').limit(1).count(:id).first.first.to_s
    end
  end
  def self.most_popular_bike(id)
    unless Trip.where(start_station_id: id).empty?
    Trip.where(start_station_id: id).group(:bike_id).order('count_id DESC').limit(1).count(:id).first.first.to_s
    end
  end
end
