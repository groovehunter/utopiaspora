class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :diaspora_handle
      t.string :first_name
      t.string :last_name
      t.string :image_url
      t.string :image_url_small
      t.string :image_url_medium
      t.date :birthday
      t.string :gender
      t.text :bio
      t.boolean :searchable
      t.integer :person_id
      t.string :location
      t.string :full_name

      t.timestamps
    end
  end
end
