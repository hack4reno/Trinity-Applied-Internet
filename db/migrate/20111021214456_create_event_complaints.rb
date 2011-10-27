class CreateEventComplaints < ActiveRecord::Migration
  def change
    create_table( :event_complaints, :id => false) do |t|
      t.string  :uuid, :limit => 36, :primary => true, :null => false
      t.string  :event_id, :limit => 36, :null => false
      
      t.string :complaint_type
      t.string :user_id, :limit => 36, :null => false
      t.string :ip_address

      t.timestamps
    end
  end
end
