class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :size
      t.text :description
      t.string :image_url
      t.belongs_to :user, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end
