class AdminController < ApplicationController
    def index
        @events = Events.all
    end

    def new
        # @event = Events.find_by_id()
    end

    def create
        # @event = Event.find_by_id()
        # @event.save
        render :index
    end

    def edit
        # @event = Event.find_by_id()
        # @event.save
    end

    def update
        # @event = Event.find_by_id()
        # @event.save
        render :index
    end

    def destroy
        # @event = Event.find_by_id()
        render :index
    end

end
