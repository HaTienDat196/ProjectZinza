json.extract! product, :id, :name, :price, :number, :image, :category, :created_at, :updated_at
json.url product_url(product, format: :json)
