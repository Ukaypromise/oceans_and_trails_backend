json.extract! reservation, :id, :startDate, :endDate, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
