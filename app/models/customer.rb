class Customer < ApplicationRecord
  belongs_to :manager, class_name: "User", foreign_key: 'user_id'
  has_many :orders
end
