class EventsController < ApplicationController
  load_and_authorize_resource

  def index
    flash[:notice] = "Welcome to the sneak peek of Reno's EventSmash! This proof-of-concept app was built in 24 hours at Hack4Reno October 15-16, 2011. The calendar events originally loaded into the system were for test purposes only, and not all the intended features are up and running yet. You are welcome to enter events (without creating an account) and you can check this space for updates once we have a more fully operational version available."
    
    @events = Event.all.to_gmaps4rails do |event|      
      "\"title\": \"#{event.name}\", \"picture\": \"http://eventsmashapp.com/assets/#{event.icon_name}.png\", \"width\": \"25\", \"length\": \"25\", \"categories\": [\"#{event.categories.collect(&:name).join('", "')}\"], \"dates\": [\"#{event.dates.join('","')}\"]"
    end
    @event = Event.new
    @event.event_categories << EventCategory.new
    @event.start_at = Date.today
    
    @categories = Category.find( :all, :order => :name )
    @events_list = Event.find(:all, :conditions => ['start_at >= ?', Date.today], :order => 'start_at asc')
  end

  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Your event was successfully added.'
        format.html { redirect_to(root_url) }
      else
        flash[:error] = 'There was a problem saving your event.'
        format.html { redirect_to(root_url) }
      end
    end
    
  end
end
