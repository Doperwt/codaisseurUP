class AddFoodToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :includes_food, :boolean, :default => false
    add_column :events, :includes_drinks, :boolean, :default => false
    add_column :events, :starts_at, :datetime
    add_column :events, :ends_at, :datetime
    add_column :events, :active, :boolean, :default => true
  end
end
