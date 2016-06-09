class EventController < ApplicationController

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
    event.time = params[:time]
    event.date = params[:date]
    event.score = params[:score]
    if event.save
      render json: event.to_json, status: 201
    else
      render json: status: 400
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
    event.time = params[:time]
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

end
