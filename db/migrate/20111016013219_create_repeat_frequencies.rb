class CreateRepeatFrequencies < ActiveRecord::Migration
  def change
    create_table(:repeat_frequencies, :id => false) do |t|
      t.string  :uuid, :limit => 36, :primary => true, :null => false
      t.string  :name

      t.timestamps
    end

    RepeatFrequency.reset_column_information
    
    %w{Daily Weekly Monthly None}.each do |name|
      RepeatFrequency.create! :name => name
    end
  end
end
