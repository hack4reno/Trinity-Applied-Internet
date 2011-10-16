class CreateAgeRatings < ActiveRecord::Migration
  def change
    create_table(:age_ratings, :id => false) do |t|
      t.string  :uuid, :limit => 36, :primary => true, :null => false
      t.string :name

      t.timestamps
    end

    AgeRating.reset_column_information
    
    ["Kids", "Teens", "Adults", "21+", "All"].each do |name|
      AgeRating.create! :name => name
    end
  end
end
