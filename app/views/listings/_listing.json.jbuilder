json.extract! listing, :id, :name, :price, :title, :description, :location, :created_at, :updated_at
json.url listing_url(listing, format: :json)
