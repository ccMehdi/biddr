json.array!(@items) do |item|
  json.extract! item, :id, :title, :detail, :end_date, :reserved_price, :user_id
  json.url item_url(item, format: :json)
end
