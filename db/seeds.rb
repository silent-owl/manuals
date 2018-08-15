# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def seed_users
  user_id = 0
  10.times do 
    User.create(
      name: "test#{user_id}",
      surname: "test#{user_id}",
      email: "test#{user_id}@test.com",
      password: '123123123',
      password_confirmation: '123123123'
    )
    user_id = user_id + 1
  end
end

def seed_categories
  default_categories = ['Arts', 'Crafts', 'Sports', 'Sciences','Development', 'Data Science', 'Business', 'Language', 'Other']
  default_categories.each do |name|
    Category.create(name: name)
  end
end

def seed_manuals
    20.times do
      Manual.create(
        title: Faker::Lorem.sentences[0], 
        description: Faker::Lorem.sentences[0], 
        user_id: rand(1..9),
        category_id: rand(1..8),
        img_url: "https://pp.userapi.com/c849236/v849236504/4b7bb/IQIQwnnhuF0.jpg"
      )
    end
end


# seed_users
# seed_categories
seed_manuals
