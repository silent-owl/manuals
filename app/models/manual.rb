class Manual < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :steps, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5, maximum: 255 }
  validates :description, presence: true, length: { minimum: 20, maximum: 2000 }
  validates :category_id, presence: true


  scope :by_category, -> (category_name) do 
      joins(:category).where(categories: {name: category_name}) 
  end

  scope :search, -> (search) do
     where("title ILIKE lower(?) OR description ILIKE lower(?)", "%#{search}%", "%#{search}%")
  end
end
