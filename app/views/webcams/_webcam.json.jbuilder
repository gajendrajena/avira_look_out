json.extract! webcam, :id, :name, :created_at, :updated_at
json.url webcam_url(webcam, format: :json)