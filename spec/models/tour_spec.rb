require 'rails_helper'

RSpec.describe 'Tour', type: :model do
  let!(:user) do
    User.create(name: 'John', email: 'john@gmail.com', password: '123456')
  end

  let!(:tour) do
    Tour.create(tourName: 'North American Tour', picture: 'https://picsum.photos/200/300',
                description: 'Visit New York, Philadelphia and Vermont', hotel: 'Ritz continental', price: 3350.40)
  end

  it 'is valid with valid attributes' do
    expect(tour).to be_valid
  end

  it 'is not valid without a tourName' do
    tour.tourName = nil
    expect(tour).to_not be_valid
  end

  it 'is not valid without a picture' do
    tour.picture = nil
    expect(tour).to_not be_valid
  end

  it 'is not valid without a description' do
    tour.description = nil
    expect(tour).to_not be_valid
  end
end
