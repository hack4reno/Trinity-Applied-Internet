class EventsController < ApplicationController
  def index
    @events = Event.all.to_gmaps4rails do |event|
      "\"title\": \"#{event.name}\", \"icon\": \"/assets/#{event.icon_name}.png\""
    end
    @event = Event.new
    @event.event_categories << EventCategory.new
    @event.start_at = Date.today
    
    @categories = Category.find( :all, :order => :name )
    @events_list = Event.find(:all, :conditions => ['start_at >= ?', Date.today], :order => 'start_at desc')
  end

  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        flash[:notice] = 'You event was successfully added.'
        format.html { redirect_to(root_url) }
      else
        flash[:error] = 'There was a problem saving your event.'
        format.html { redirect_to(root_url) }
      end
    end
    
  end
end
