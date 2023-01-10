require 'swagger_helper'

describe 'Reservations API' do
  before(:each) do
   user1 = User.create(name: 'John', email: 'john@gmail.com', password: '123456')
   user1.save!
  end

  before(:each) do
   tour2 = Tour.create(tourName: 'North American Tour', picture: 'https://picsum.photos/200/300', description: 'Visit New York, Philadelphia and Vermont', hotel: 'Ritz continental', price: 3350.40)
   tour2.save!
  end

  path '/api/v1/users/{id}/reservations' do
    post 'Creates a reservation' do
      tags 'reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: { type: :object,
                                                         properties: {
                                                           id: { type: :integer },
                                                           startDate: { type: :string },
                                                           endDate: { type: :string },
                                                           user_id: { type: :integer },
                                                           tour_id: { type: :integer }
                                                         },
                                                         required: %w[id startDate endDate user_id tour_id] }
      response '201', 'reservation created' do
        let!(:user1) do
          User.create(name: 'John', email: 'john1@gmail.com', password: '123456')
        end

        let!(:tour2) do
          Tour.create(tourName: 'North American Tour', picture: 'https://picsum.photos/200/300', description: 'Visit New York, Philadelphia and Vermont', hotel: 'Ritz continental', price: 3350.40)
        end
        
        let(:reservation) do
          Reservation.create(user: user1, tour: tour2, startDate: '2021-01-01', endDate: '2021-01-05')
        end
        run_test!
      end
      response '401', 'You need to sign in or sign up before continuing.' do
        let(:reservation) { { endDate: '2021-01-05' } }
        run_test!
      end
    end

    get('List all reservations') do
      tags 'reservations'
      produces 'application/json'
      let!(:reservation) do
        { startDate: '2021-01-01', endDate: '2021-01-05', user_id: 2, tour_id: 2 }
      end

      response(200, 'successful') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   startDate: { type: :string },
                   endDate: { type: :string },
                   user_id: { type: :integer },
                   tour_id: { type: :integer }
                 },
                 required: %w[id startDate endDate user_id tour_id]
               }

        let!(:reservation) do
          Reservation.create(user: user1, tour: tour2, startDate: '2021-01-01', endDate: '2021-01-05')
        end
        run_test! do |response|
          response = JSON.parse(response.body)
          expect(response.first['startDate']).to eq('2021-01-01')
        end
      end
    end
  end
end
