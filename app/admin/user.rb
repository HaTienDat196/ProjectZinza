ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :avartar
  index do
    selectable_colum
    id_colum
    colum :email
    colum :password
    colum :password_confirmation
    colum :avartar
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :avartar
    end
    f.actions
  end

end
