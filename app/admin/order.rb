ActiveAdmin.register Order do
  permit_params :cost, :role, :description, :number_of_items, :customer_id

  index do
    selectable_column
    id_column
    column :cost
    column :role
    column :description
    column :number_of_items
    column :customer do |r|
      r.customer.first_name
    end
    column :created_at
    actions
  end

  filter :cost_between
  filter :number_of_items_between
  filter :description
  # filter :customer, as: :select, collection: customer.all.map {|user| [user.email, user.id]}
  filter :created_at

  form do |f|
    f.inputs do
      f.input :description
      f.input :number_of_items
      f.input :cost
      f.input :customer, as: :select, collection: Customer.all.map {|customer| ["#{customer.first_name} #{customer.last_name}", customer.id]}
    end
    f.actions
  end

end
