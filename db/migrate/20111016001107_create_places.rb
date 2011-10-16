class CreatePlaces < ActiveRecord::Migration
  def change
    create_table(:places, :id => false) do |t|
      t.string  :uuid, :limit => 36, :primary => true, :null => false
      t.string  :name
      t.text    :description
      t.decimal :latitude, :precision => 14, :scale => 10
      t.decimal :longitude, :precision => 14, :scale => 10
      t.string  :address_1
      t.string  :address_2
      t.string  :city
      t.string  :state
      t.string  :zipcode
      t.string  :country, :default => 'USA'
      t.boolean :gmaps

      t.timestamps
    end
    
  end
end
