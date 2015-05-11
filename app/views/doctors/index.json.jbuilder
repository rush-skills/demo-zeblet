json.array!(@doctors) do |doctor|
  json.extract! doctor, :id, :name, :clinic_id, :specialization, :experience, :title, :photo
  json.url doctor_url(doctor, format: :json)
end
