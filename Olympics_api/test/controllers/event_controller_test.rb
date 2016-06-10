require 'test_helper'
require 'rspec'

class EventControllerTest < ActionController::TestCase

  describe '#index' do
    context 'when request is made' do
      it 'Returns an event'
      Event.create(sport_title: 'hockey')
      expect Event.find_by(sport_title: 'hockey').to_eql = true
    end
  end

  describe '#show' do
    context 'when resource is found' do
      it 'responds with 200'
        expect 200
      it 'shows the resource'
    end

    context 'when resource is not found' do
      it 'responds with 404'
        params[:id] = -5
        event = Event.find_by_id(params[:id])
        expect 404
    end

  end

  describe '#delete' do
    context 'when resource is found' do
      it 'responds with 200'
      it 'deletes the resource'
    end

    context 'when resource is not found' do
      it 'responds with 404'
    end
  end


end
