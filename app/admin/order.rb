ActiveAdmin.register Order do
  permit_params :name, :address, :email, :pay_type
end
