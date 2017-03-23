class AddCityIdColumnToStation < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :city, :city_id
  end
end
