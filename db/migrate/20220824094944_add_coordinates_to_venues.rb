class AddCoordinatesToVenues < ActiveRecord::Migration[7.0]
  def change
    add_column :venues, :latiude, :float
    add_column :venues, :longitude, :float
  end
end
