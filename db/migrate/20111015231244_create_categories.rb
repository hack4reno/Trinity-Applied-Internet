class CreateCategories < ActiveRecord::Migration
  def change
    create_table(:categories, :id => false) do |t|
      t.string  :uuid, :limit => 36, :primary => true, :null => false
      t.string :name
      t.string :description

      t.timestamps
    end
    
    Category.reset_column_information
    
    %w{Sports Government Music Arts Education Theater Nightlife Training Entertainment Civic Volunteer Literature Tech Comedy Concert Meeting}.each do |name|
      Category.create! :name => name
    end
  end
end
