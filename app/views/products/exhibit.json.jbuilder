json.array! @product do |image|
  json.id @product.id
  json.image @product.url
end
