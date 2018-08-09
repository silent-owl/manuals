class User < ApplicationRecord
  has_many :manuals, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
