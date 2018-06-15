class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates  :role, presence: true
  validates  :role, inclusion: { in: %w(manager admin supervisor),
    message: "%{value} is not a valid " }
end
