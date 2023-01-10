require 'swagger_helper'

describe 'Tours API' do
    
      path '/api/v1/tours' do
    
     get 'Retrieves Tours' do
        tags 'Tours'
        produces 'application/json'
    
        response '200', 'tours found' do
          schema type: :object,
             properties: {
                tours: {
                  type: :array,
                  items: {
                 type: :object,
                 properties: {
                    id: { type: :integer },
                    tourName: { type: :string },
                    picture: { type: :string },
                    description: { type: :string },
                    hotel: { type: :string },
                    price: { type: :number },
                    created_at: { type: :string },
                    updated_at: { type: :string }
                 }
                  }
                }
             },
             required: [ 'tours' ]
    
          run_test!
        end
    
        response '404', 'tours not found' do
          let(:tours) { { tourName: 'foo' } }
          run_test!
        end
     end
      end
    
      path 'api/v1/tours/{id}' do
    
     get 'Retrieves a tour' do
        tags 'Tours'
        produces 'application/json'
        parameter name: :id, in: :path, type: :string
    
        response '200', 'tour found' do
          schema type: :object,
             properties: {
                id: { type: :integer },
                tourName: { type: :string },
                picture: { type: :string },
                description: { type: :string },
                hotel: { type: :string },
                price: { type: :number },
                created_at: { type: :string },
                updated_at: { type: :string }
             },
             required: [ 'id', 'tourName', 'picture', 'description', 'hotel', 'price', 'created_at', 'updated_at' ]
    
          let(:id) { Tour.create(tourName:'North American Tour', picture: 'https://picsum.photos/200/300', description: 'Visit New York, Philadelphia and Vermont', hotel:'Ritz continental', price: 3350.40).id }
          run_test!
        end
    
        # response '404', 'tour not found' do
        #   let(:id) { 'invalid' }
        #   run_test!
        # end
     end
      end
    
      
    end
