require 'swagger_helper'

describe 'Log_in API' do
  path '/sessions' do
    post 'User sign-in' do
      tags 'login'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: { type: :object,
                                                  properties: {
                                                    user: {
                                                      type: :object,
                                                      properties: {
                                                        email: { type: :string },
                                                        password: { type: :string }
                                                      },
                                                      required: %w[email password]
                                                    }
                                                  } }

      response '201', 'user created' do
        let(:user) do
          User.create(name: 'John Doe', email: 'test@test.com', password: '123456',
                      password_confirmation: '123456')
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'Addis' } }
        run_test!
      end
    end
  end
end

describe 'Sign_up API' do
  path '/registrations' do
    post 'Creates an user' do
      tags 'registration'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: { type: :object,
                                                  properties: {
                                                    user: {
                                                      type: :object,
                                                      properties: {
                                                        name: { type: :string },
                                                        email: { type: :string },
                                                        password: { type: :string },
                                                        password_confirmation: { type: :string }
                                                      },
                                                      required: %w[name email password]
                                                    }
                                                  } }

      response '201', 'user created' do
        let(:user) do
          User.create(name: 'John Doe', email: 'test@test.com', password: '123456',
                      password_confirmation: '123456')
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'Addis' } }
        run_test!
      end
    end
  end
end
