json.array!(@items) do |item|
  json.extract! item, :id, :user_id, :category_id, :title, :source_url, :image_url, :price, :sale_price, :required_price, :size, :color, :notes, is_change, :is_private
  json.url item_url(item, format: :json)
end
