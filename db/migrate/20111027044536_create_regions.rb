class CreateRegions < ActiveRecord::Migration
  def change
    create_table(:regions, :id => false) do |t|
      t.string  :uuid, :limit => 36, :primary => true, :null => false
      t.string  :name
      t.decimal :latitude, :precision => 14, :scale => 10
      t.decimal :longitude, :precision => 14, :scale => 10
      t.integer :zoom

      t.timestamps
    end

  end
end
