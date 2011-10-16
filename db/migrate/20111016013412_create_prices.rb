class CreatePrices < ActiveRecord::Migration
  def change
    create_table(:prices, :id => false) do |t|
      t.string  :uuid, :limit => 36, :primary => true, :null => false
      t.string :name

      t.timestamps
    end

    Price.reset_column_information
    
    %w{$ $$ $$$ $$$$ $$$$$ Free}.each do |name|
      Price.create! :name => name
    end
  end
end
