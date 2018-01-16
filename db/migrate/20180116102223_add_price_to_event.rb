class AddPriceToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :price, :float, :default => 0
  end
end
