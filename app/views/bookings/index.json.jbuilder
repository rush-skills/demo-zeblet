json.array!(@bookings) do |booking|
  json.extract! booking, :id, :doctor_id, :user_id, :timing
  json.url booking_url(booking, format: :json)
end
