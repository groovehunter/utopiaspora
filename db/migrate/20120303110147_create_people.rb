class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :guid
      t.text :url
      t.string :diaspora_handle
      t.text :serialized_public_key
      t.integer :owner_id

      t.timestamps
    end
  end
end
