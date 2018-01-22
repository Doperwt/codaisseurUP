class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :size
      t.text :description
      t.string :image_url, :default => "https://images-na.ssl-images-amazon.com/images/I/41m4vuGbstL._SY300_.jpg"
      t.belongs_to :user, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end
