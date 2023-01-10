require 'rails_helper'

RSpec.describe 'Reservation', type: :model do
  let!(:user) do
    User.create(name: 'John', email: 'john@gmail.com', password: '123456')
  end

  let!(:tour) do
    Tour.create(tourName: 'North American Tour', picture: 'https://picsum.photos/200/300',
                description: 'Visit New York, Philadelphia and Vermont', hotel: 'Ritz continental', price: 3350.40)
  end

  let!(:reservation) do
    Reservation.create(user: user, tour: tour, startDate: '2021-01-01', endDate: '2021-01-05')
  end

  it 'is valid with valid attributes' do
    expect(reservation).to be_valid
  end

  it 'is not valid without a user' do
    reservation.user = nil
    expect(reservation).to_not be_valid
  end

  it 'is not valid without a tour' do
    reservation.tour = nil
    expect(reservation).to_not be_valid
  end
end
