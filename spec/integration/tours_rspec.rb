require 'swagger_helper'

describe 'Tours API' do
  path '/api/v1/tours' do
    post 'Creates a tour' do
      tags 'tours'
      consumes 'application/json'
      parameter name: :tour, in: :body,
                schema: { type: :object,
                          properties: { id: { type: :integer }, tourName: { type: :string }, picture: { type: :string },
                                        description: { type: :string }, hotel: { type: :integer }, price: { type: :boolean }
                          }, required: %w[id tourName description destination hotel] }
      response '201', 'tour created' do
        let(:tour) do
          Tour.create(tourName: 'Caribean Cruise 7days', description: '7 day cruise across the Caribean 4 stops', price: 4790,
                      hotel: 'In house', picture: 'https://images.pexels.com/photos/2678418/pexels-photo-2678418.jpeg?auto=compress&cs=tinysrgb&w=1600')
        end
        run_test!
      end
      response '422', 'invalid request' do
        let(:tour) { { tourName: 'testing' } }
        run_test!
      end
    end

    get('List all tours') do
      tags 'tours'
      produces 'application/json'
      let!(:tour) do
        { tourName: 'Caribean Cruise 7days', description: '7 day cruise across the Caribean 4 stops', price: 4790,
          hotel: 'In house',
          picture: 'https://images.pexels.com/photos/2678418/pexels-photo-2678418.jpeg?auto=compress&cs=tinysrgb&w=1600' }
      end

      response(200, 'successful') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer }, tourName: { type: :string }, picture: { type: :string },
                   description: { type: :string }, hotel: { type: :integer }, price: { type: :boolean }
                 },
                 required: %w[id tourName description destination hotel]
               }
        let!(:tour) do
          Tour.create(tourName: 'Caribean Cruise 7days', description: '7 day cruise across the Caribean 4 stops', price: 4790,
                      hotel: 'In house', picture: 'https://images.pexels.com/photos/2678418/pexels-photo-2678418.jpeg?auto=compress&cs=tinysrgb&w=1600')
        end
        run_test! do |response|
          response = JSON.parse(response.body)
          expect(response.first['tourName']).to eq(tour.tourName)
        end
      end
    end
  end
end
