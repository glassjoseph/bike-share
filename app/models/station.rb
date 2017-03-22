class Station < ActiveRecord::Base
  # def initialize
  # end
  belongs_to :city
  has_many :trips


	validates :name, presence: true #uniq?
	validates :dock_count, presence: true
	validates :city_id, presence: true
	validates :installation_date, presence: true

  def self.total
    all.count
    #necessary? Or should we delete this method and just use Station.count instead?
  end

  def self.avg
    # count_array = all.select('dock_count')
    # (count_array.inject(0){ |sum, el| sum + el.dock_count }.to_f / count_array.size).round(1)
    self.average(:dock_count).round(1).to_f
  end

  def self.most_bikes
    # array_by_dock_count = all.max_by {|dock| dock.dock_count}
    self.where(dock_count: self.maximum(:dock_count)).first
  end

  def self.least_bikes
    # array_by_dock_count = all.min_by {|dock| dock.dock_count}
    self.where(dock_count: self.minimum(:dock_count)).first
  end

  def self.newest_station
    # array_by_dock_count = all.max_by {|dock| dock.installation_date}
    self.where(installation_date: self.maximum(:installation_date)).first
  end

  def self.oldest_station
    # array_by_dock_count = all.min_by {|dock| dock.installation_date}
    self.where(installation_date: self.minimum(:installation_date)).first
  end

  def self.most_popular_date(id)
    Trip.where(start_station_id: id).group("DATE_TRUNC('day', start_date)").order('count_id DESC').limit(1).count(:id).flatten.to_s.to_date
  end
  def self.most_popular_customer_zip(id)
    Trip.where(start_station_id: id).group(:zip_code).order('count_id DESC').limit(1).count(:id).first.first.to_s
  end
  def self.most_popular_bike(id)
    Trip.where(start_station_id: id).group(:bike_id).order('count_id DESC').limit(1).count(:id).first.first.to_s
  end

end
