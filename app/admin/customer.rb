ActiveAdmin.register Customer do
   permit_params :email,:password,:password_confirmation, :role, :status,
                :phone_number, :user_id, :first_name, :last_name

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :phone_number
    column :manager
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
    f.input :first_name
    f.input :last_name
    f.input :phone_number
    f.input :manager, as: :select, collection: User.all.map {|user| [user.email, user.id]}
    f.input :status, as: :select,:collection => ["activ", "inactiv"], :include_blank => false
    f.actions
    end
  end
end


