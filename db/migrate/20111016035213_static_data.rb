class StaticData < ActiveRecord::Migration
  def up
    Place.reset_column_information
    
    p = Place.create :name => 'Pioneer Center', :latitude => 39.5241, :longitude => -119.812, :address_1 => '100 S Virginia St.', :city => 'Reno', :state => 'NV', :zipcode => '89501'
    
    Event.reset_column_information
    Event.create :name => 'Hack4Reno', :place => p, 
                 :start_at => Time.local( 2011, 10, 15, 10, 0 ), :end_at => Time.local( 2011, 10, 16, 12, 0 ), 
                 :latitude => 39.5241, :longitude => -119.812, 
                 :repeat_frequency => RepeatFrequency.find_by_name('None'),
                 :age_rating => AgeRating.find_by_name( "Adults" ),
                 :price => Price.find_by_name('$')

  end

  def down
  end
end
