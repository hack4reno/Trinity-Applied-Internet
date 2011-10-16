class CreateUserTokens < ActiveRecord::Migration
  def change
    create_table( :user_tokens, :id => false ) do |t|
      t.string  :uuid, :limit => 36, :primary => true, :null => false
      t.string  :user_id, :limit => 36, :null => false
      t.string  :provider, :null => false
      t.string  :uid, :null => false

      t.timestamps
    end
  end
end
