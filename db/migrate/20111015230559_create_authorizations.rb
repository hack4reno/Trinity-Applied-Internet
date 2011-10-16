class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table( :authorizations, :id => false ) do |t|
      t.string :uuid, :limit => 36, :primary => true, :null => false
      t.string :user_id, :limit => 36, :null => false
      t.string :service_name
      t.string :service_id
      t.string :service_url
      t.string :type
      t.string :app_id
      t.string :app_secret
      t.string :key
      t.string :secret
      t.boolean :deleted, :null => false, :default => false
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end
end
