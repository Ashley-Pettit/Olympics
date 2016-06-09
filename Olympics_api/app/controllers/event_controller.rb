class EventController < ApplicationController

  # Countries/Sports have not been isolated into other Controllers/Models
  # An assumption is made that the only data requiring creation is events and that this is the only object requiring CRUD functionality

  #view all => get '/event'
  def index
    Event.all.to_json
  end

  # view one => get '/event/:id'
  def show
    event = Event.find(params[:id])
    return status 404 if event.nil?
    event.to_json
  end

  # create => post '/events'
  def create
    event = Event.new
    event.sport_title = params[:sport_title]
    event.countryA = params[:countryA]
    event.countryB = params[:countryB]
    event.start_time = params[:start_time]
    event.end_time = params[:end_time]
    event.date = params[:date]
    event.countryAScore = params[:countryAScore]
    event.countryBScore = params[:countryBScore]
    if event.save
      render json: event.to_json, status: 201
    else
      render json: status: 500
    end
  end

  # update => patch '/events/:id'
  def update
    event = Event.find(params[:id])
    #if event not found send page not found error
    return status 404 if event.nil?
    event.sport_title = params[:sport_title]
    event.countryA = params[:countryA]
    event.countryB = params[:countryB]
    event.start_time = params[:start_time]
    event.end_time = params[:end_time]
    event.date = params[:date]
    event.score = params[:score]
    if event.save
      #if saved then output saved data to JSON
      render json: event.to_json, status: 201
    else
      #if failed send bad request error
      render json: status: 400
    end
  end

  # delete => delete '/events/:id'
  def update
    event = Event.find(params[:id])
    return status 404 if event.nil?
    event.delete
    status 202
  end

  def is_event_presently_running?
    Time.now.between?(event.start_time, event.end_time)
  end

  def is_event_in_past?
    Time.now >= event.end_time
  end

  def is_event_in_future?
    Time.now <= event.start_time
  end

  def draw?
    event.countryAScore = event.countryBScore
  end

  def search #This function is likely unnecessary
    #This function shoud do the following
    # - Display events which are coming up.
    # - View the sports that are currently in progress.
    # - Displays results from the previous games/races under the current sports.
    # Eg. Basketball -> USA are currently playing Australia, 1hr ago Brazil defeated China 89-76, 2hrs ago Russia defeated Japan 102-101. Next game is USA vs Spain in 4 hours.
    search_input = params[:sport_search]
    @results = Event.find_by(sport_title: search_input) #Will this return 1 or more?
    @output = ["#{search_input} ->"]
    @results.each do |event|
      if event.is_event_presently_running?
        @output << "#{event.countryA} are current playing #{event.countryB},"
      elsif event.is_event_in_past?
        if !draw?
          results = get_results
          @output << "#{(Time.now - event.end_time).hour} hour(s) ago #{results.winning_country} defeated #{results.losing_country} #{results.winning_score}-#{results.losing_score},"
        elsif
          @output << "Draw Message"
        end
      elsif event.is_event_in_future?
        @output << "Next game is #{event.countryA} vs #{event.countryB} in #{(Time.now - event.start_time).hour}"
      end
    end

  def get_results
    if event.countryAScore > event.countryBScore
      results = {
        winning_country: event.countryA
        losing_country: event.countryB
        winning_score: event.countryAScore
        losing_score: event.countryBScore
      }
    elsif event.countryBScore > event.countryAScore
      results = {
        winning_country: event.countryB
        losing_country: event.countryA
        winning_score: event.countryBScore
        losing_score: event.countryAScore
      }
    end
  end

end
