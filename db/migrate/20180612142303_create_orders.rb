class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :cost
      t.string :description
      t.integer :number_of_items
      t.belongs_to :customer, index: true

      t.timestamps
    end
  end
end
