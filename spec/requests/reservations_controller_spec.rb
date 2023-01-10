require 'rails_helper'

RSpec.describe 'Reservation', type: :request do 
    include Devise::Test::IntegrationHelpers

    let!(:user) do
        User.create(name: 'John', email: 'john@gmail.com', password: '123456')
    end

    let!(:tour) do
        Tour.create(tourName:'North American Tour', picture: 'https://picsum.photos/200/300', description: 'Visit New York, Philadelphia and Vermont', hotel:'Ritz continental', price: 3350.40)
    end

    let!(:reservation) do
        Reservation.create(user: user, tour: tour, startDate: '2021-01-01', endDate: '2021-01-05')
    end

    describe 'GET /index' do
        before do
            sign_in user
            get api_v1_user_reservations_path(user.id)
        end

        it 'renders a successful response' do
            expect(response).to be_successful
        end
    end
end