json.array!(@stores) do |store|
  json.extract! store, :id, :name, :model, :make, :year, :color, :price, :description, :feature1, :feature2, :feature3, :feature4
  json.url store_url(store, format: :json)
end
