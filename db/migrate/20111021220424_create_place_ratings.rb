class CreatePlaceRatings < ActiveRecord::Migration
  def change
    create_table( :place_ratings, :id => false ) do |t|
      t.string  :uuid, :limit => 36, :primary => true, :null => false
      t.string  :place_id, :limit => 36, :null => false
      t.string  :user_id, :limit => 36, :null => false
      t.integer :rating, :null => false
      t.string  :ip_address

      t.timestamps
    end
  end
end
