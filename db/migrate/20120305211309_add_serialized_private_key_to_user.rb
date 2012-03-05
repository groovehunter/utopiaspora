class AddSerializedPrivateKeyToUser < ActiveRecord::Migration
  def change
    add_column :users, :serialized_private_key, :text
  end
end
