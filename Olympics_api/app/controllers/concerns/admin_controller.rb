class AdminController < ApplicationController

  def index
    @events = Event.order(:time)
    if @events.length > 0
      @events_arr = []
      @events.each do |event|
        @events_arr << "<h3 id="event_title"><%= #{event.sport} - #{event.country1} Vs. #{event.country2} - #{event.time} %> </h3>"
      end
    else
      @events_arr << "<h3>There are no events. Why not create some?</h3>"
    end
  end

  def new
    render :new
  end

  def create
    # event = Event.new
    # @event.title = params[:event_title_input]
    # @event.country1 = params[:country1_input]
    # @event.country1 = params[:country2_input]
    # @event.time = params[:event_time_input]
    # @event.date = params[:event_date_input]
    # @event.save
    # @events = Event.order(:time)
    render :index #After creating an event - Return to Admin index
  end

  def edit
    # @event = Event.find_by_id(params[:id])
  end

  def update
    # @event = Event.find_by_id(params[:id])
    # @event.title = params[:event_title_input]
    # @event.country1 = params[:country1_input]
    # @event.country1 = params[:country2_input]
    # @event.time = params[:event_time_input]
    # @event.date = params[:event_date_input]
    # @event.save
    render :index
  end

  def delete
    # event = Event.find_by_id(params[:id])
    # event.destroy
    render :index
  end

end
