class AddFoodCategory < ActiveRecord::Migration
  def up
    Category.create! :name => 'Food'
  end

  def down
  end
end
