class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :album
      t.string :url

      t.timestamps
    end
    add_index :pictures, :album_id
  end
end
