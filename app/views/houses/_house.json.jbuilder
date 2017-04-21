json.extract! house, :id, :title, :description, :location, :price, :type, :address, :listing_display, :status, :seller_id, :created_at, :updated_at
json.url house_url(house, format: :json)