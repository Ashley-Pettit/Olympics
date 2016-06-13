require 'rspec'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

#Using FactoryGirl to make an event
FactoryGirl.define do
  factory :event do
    sport_title "Basketball"
    countryA  "Australia"
    countryB "New Zealand"
    start_time "2015-08-01 14:36:00 +1000"
    finish_time "2015-08-01 16:36:00 +1000"
    countryA_score "21"
    countryB_score "42"
  end

RSpec.describe V1::EventsController, type: :controller do
  let!(:event) {Event.create(:event)}

  context '#index' do
    before(:each) do
      get :index
    end

      it 'renders successfully' do
        expect(response).to be_success
      end

      it 'returns one object' do
        expect(response.count).to eq(1)
      end
  end

  context '#destroy' do
      it 'the event is deleted' do
        delete 'v1/events/:id.json', {id: event.id}
        expect Event.find_by_id(event.id).nil?.to_eql true
      end
  end


end
