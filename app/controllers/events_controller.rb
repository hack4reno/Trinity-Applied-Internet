class EventsController < ApplicationController
  def index
    @events = Event.all.to_gmaps4rails do |event|
      
    end
    
    @categories = Category.find( :all, :order => :name )
  end

end
