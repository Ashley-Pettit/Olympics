module V1
  class EventsController < ApplicationController
    before_action :set_event, only: [:show, :update, :destroy]

    #view all => get '/event'
    def index
      render json: Event.all.to_json, status: 200
    end

    # view one => get '/event/:id'
    def show
      render json: @event.to_json, status: 200
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
        render json: {message: "Failed to create new event"}, status: 500
      end
    end

    # update => patch '/events/:id'
    def update
      @event.update!(event_params)
      if @event.save
        #if saved then output saved data to JSON
        render json: @event.to_json, status: 201
      else
        #if failed send bad request error
        render json: {message: "Failed to update event"}, status: 400
      end
    end

    # delete => delete '/events/:id'
    def destroy
      @event.delete
      render json: {message: "Event has been deleted"}, status: 202
    end

    protected

    def set_event
      #Find will return 404 if not found
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit( :sport_title, :countryA, :countryB, :start_time, :end_time, :date, :countryAScore, :countryBScore)
    end

  end
end
