ActiveAdmin.register Product do
  permit_params :category_id, :name, :price, :image, :number
end
