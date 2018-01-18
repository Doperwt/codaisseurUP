class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.references :event, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end
