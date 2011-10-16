class AddFreePriceOption < ActiveRecord::Migration
  def up
    Price.create! :name => 'Free'
    Price.create! :name => 'Donations Welcome'
  end

  def down
  end
end
