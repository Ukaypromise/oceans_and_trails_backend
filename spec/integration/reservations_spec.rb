require 'swagger_helper'

describe 'Reservations API' do
  path '/api/v1/users/1/reservations' do
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
        let(:reservation) do
          Reservation.create(user: User2, tour: tour2, startDate: '2021-01-01', endDate: '2021-01-05')
        end
        run_test!
      end
      response '422', 'You need to sign in or sign up before continuing.' do
        let(:reservation) { { endDate: '2021-01-05' } }
        run_test!
      end
    end

    get('List all reservations') do
      tags 'reservations'
      produces 'application/json'
      let!(:reservation) do
        { startDate: '2021-01-01', endDate: '2021-01-05', user_id: 1, tour_id: 1 }
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
          Reservation.create(user: User2, tour: tour2, startDate: '2021-01-01', endDate: '2021-01-05')
        end
        run_test! do |response|
          response = JSON.parse(response.body)
          expect(response.first['title']).to eq(reservation.startDate)
        end
      end
    end
  end
end
