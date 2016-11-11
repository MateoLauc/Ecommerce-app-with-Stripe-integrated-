json.extract! line_item, :id, :variant_id, :cart_id, :qty, :created_at, :updated_at
json.url line_item_url(line_item, format: :json)