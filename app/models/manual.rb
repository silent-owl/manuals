class Manual < ApplicationRecord
	belongs_to :user
	belongs_to :category

	scope :by_category, -> (category_name) do 
    	joins(:category).where(categories: {name: category_name}) 
  	end

	scope :search, -> (search) do
	   where("title ILIKE lower(?) OR description ILIKE lower(?)", "%#{search}%", "%#{search}%")
	end
end
