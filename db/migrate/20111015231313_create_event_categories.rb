class CreateEventCategories < ActiveRecord::Migration
  def change
    create_table(:event_categories, :id => false) do |t|
      t.string  :uuid, :limit => 36, :primary => true, :null => false
      t.string  :event_id, :limit => 36, :null => false      
      t.string  :category_id, :limit => 36, :null => false      

      t.timestamps
    end
  end
end
