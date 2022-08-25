class ChangePriceToIntegerInVenues < ActiveRecord::Migration[7.0]
  def change
    change_column :venues, :price, :integer
  end
end
