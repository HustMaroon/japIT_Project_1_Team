json.array!(@images) do |image|
  json.extract! image, :id, :user_id, :title, :string, :file, :string, :created_at, :datetime
  json.url image_url(image, format: :json)
end
