require 'rails_helper'

RSpec.describe '/tours', type: :request do
    let!(:user) do
        User.create(name: 'John', email: 'john@gmail.com', password: '123456')
    end

    let!(:tour) do
        Tour.create(tourName:'North American Tour', picture: 'https://picsum.photos/200/300', description: 'Visit New York, Philadelphia and Vermont', hotel:'Ritz continental', price: 3350.40)
    end

    describe 'GET /index' do
        before do
            get api_v1_tours_path
        end

        it 'renders a successful response' do
            expect(response).to be_successful
        end
    end
end