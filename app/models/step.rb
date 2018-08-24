class Step < ApplicationRecord
	belongs_to :manual
	validates :title, presence: true, length: { minimum: 5, maximum: 255 }
	validates :description, presence: true
	validates :count, presence: true
end
