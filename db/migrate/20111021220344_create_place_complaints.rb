class CreatePlaceComplaints < ActiveRecord::Migration
  def change
    create_table( :place_complaints, :id => false) do |t|
      t.string  :uuid, :limit => 36, :primary => true, :null => false
      t.string  :place_id, :limit => 36, :null => false
      
      t.string :complaint_type
      t.string :user_id, :limit => 36, :null => false
      t.string :ip_address

      t.timestamps
    end
  end
end
