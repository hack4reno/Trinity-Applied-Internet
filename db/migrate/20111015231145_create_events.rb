class CreateEvents < ActiveRecord::Migration
  def change
    create_table(:events, :id => false) do |t|
      t.string  :uuid, :limit => 36, :primary => true, :null => false
      t.string  :original_event_id, :limit => 36, :null => true      
      t.string :name
      t.text   :description
      t.decimal :latitude, :precision => 14, :scale => 10
      t.decimal :longitude, :precision => 14, :scale => 10
      t.string  :place_id, :limit => 36, :null => false
      t.datetime :start_at
      t.datetime :end_at
      t.string  :repeat_frequency_id, :limit => 36, :null => false      
      t.text :cancelled_dates
      t.string  :age_rating_id, :limit => 36, :null => false      
      t.string  :price_id, :limit => 36, :null => false      
      t.boolean :gmaps

      t.timestamps
    end

    add_index :events, :latitude
    add_index :events, :longitude
    add_index :events, [:latitude, :longitude]
    add_index :events, :start_at
    add_index :events, :end_at
    add_index :events, [:start_at,:end_at]
    add_index :events, :place_id
    add_index :events, :age_rating_id
    add_index :events, :price_id

    add_index :events, :original_event_id
    
  end
end
