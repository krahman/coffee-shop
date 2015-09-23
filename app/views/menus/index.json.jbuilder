json.array!(@menus) do |menu|
  json.extract! menu, :id, :name, :price, :type_id, :size_id
  json.url menu_url(menu, format: :json)
end
