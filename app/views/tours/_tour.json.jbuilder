json.extract! tour, :id, :tourName, :picture, :description, :hotel, :price, :created_at, :updated_at
json.url tour_url(tour, format: :json)
