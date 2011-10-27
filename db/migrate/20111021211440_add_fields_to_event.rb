class AddFieldsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :created_by, :string, :limit => 36, :null => true      
    add_column :events, :updated_by, :string, :limit => 36, :null => true      
    add_column :events, :is_spam, :boolean, :null => false, :default => false    
    add_column :events, :is_inaccurate, :boolean, :null => false, :default => false    
    add_column :events, :is_private, :boolean, :null => false, :default => false    
    add_column :events, :is_cancelled, :boolean, :null => false, :default => false
    add_column :events, :is_deleted, :boolean, :null => false, :default => false
    add_column :events, :rating, :float, :null => true
    
    add_column :places, :created_by, :string, :limit => 36, :null => true      
    add_column :places, :updated_by, :string, :limit => 36, :null => true      
    add_column :places, :authentic_place_id, :string, :limit => 36, :null => true      
    add_column :places, :is_spam, :boolean, :null => false, :default => false    
    add_column :places, :is_inaccurate, :boolean, :null => false, :default => false    
    add_column :places, :is_duplicate, :boolean, :null => false, :default => false    
    add_column :places, :is_private, :boolean, :null => false, :default => false    
    
    
    
  end
end
