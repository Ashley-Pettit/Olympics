class EventController < ApplicationController

  # Countries/Sports have not been isolated into other Controllers/Models
  # An assumption is made that the only data requiring creation is events and that this is the only object requiring CRUD functionality.
  # Potentially this isn't best practice however, I decided class seperation wasn't warrented for this excercise.

  #view all => get '/event'
  def index
    Event.all.to_json
  end

  # view one => get '/event/:id'
  def show
    event = Event.find_by_id(params[:id])
    #if the event does not exist give error 404 and do not output JSON
    return status 404 if event.nil?
    render json: event.to_json, status: 200
  end

  def search
    search_input = params[:sport_search]
    search_results = Event.find_each(sport_title: search_input)
    render json: search_results.to_json, status: 200
  end

  # create => post '/events'
  def create
    #To whitelist params
    Event.create(event_params)
    if event.save
      render json: event.to_json, status: 201
    else
      render json: status: 500
    end
  end

  # update => patch '/events/:id'
  def update
    event = Event.find(params[:id])
    event.update!(event_params)
    #if event not found send page not found error
    return status 404 if event.nil?
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

  # def search #Is this function necessary?
  #   search_input = params[:sport_search]
  #   @results = Event.find_each(sport_title: search_input)
  #   @output = ["#{search_input} ->"]
  #   @results.each do |event|
  #     if event.is_event_presently_running?
  #       @output << "#{event.countryA} are current playing #{event.countryB},"
  #     elsif event.is_event_in_past?
  #       if !draw?
  #         results = get_results
  #         @output << "#{(Time.now - event.end_time).hour} hour(s) ago #{results.winning_country} defeated #{results.losing_country} #{results.winning_score}-#{results.losing_score},"
  #       elsif
  #         @output << "Draw Message"
  #       end
  #     elsif event.is_event_in_future?
  #       @output << "Next game is #{event.countryA} vs #{event.countryB} in #{(Time.now - event.start_time).hour}"
  #     end
  #   end

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

  protected

  def event_params
    params.require(:sport_title].permit( :countryA, :countryB, :start_time, :end_time, :date:countryAScore, :countryBScore)
  end

end
