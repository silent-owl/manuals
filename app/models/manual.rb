class Manual < ApplicationRecord
  include SearchCop
  belongs_to :user
  belongs_to :category
  has_many :steps, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5, maximum: 255 }
  validates :description, presence: true, length: { minimum: 20, maximum: 2000 }
  validates :category_id, presence: true


  scope :by_category, -> (category_name) do 
      joins(:category).where(categories: {name: category_name}) 
  end

  search_scope :search do
      attributes :title, :description
      attributes step: ['steps.description', 'steps.title']
      options :all, :type => :fulltext
    end
end
