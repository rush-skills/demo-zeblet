json.array!(@clinics) do |clinic|
  json.extract! clinic, :id, :name, :address
  json.url clinic_url(clinic, format: :json)
end
