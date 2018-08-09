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
  default_categories = ['Arts', 'Crafts', 'Sports', 'Sciences', 'Collecting',
   'Reading','Study', 'Development', 'Arts and Hobby','Arts and Humanities',
    'Physical Science and Engineering', 'Math and Logic',
    'Computer Science', 'Data Science', 'Economics and Finance', 'Business',
    'Social Sciences', 'Language', 'Other']
  

  default_categories.each do |name|
    Category.create(name: name)
  end

  
end

def seed_manuals
    5.times do
      Manual.create(
        title: Faker::Lorem.sentences[0], 
        description: Faker::Lorem.sentences[0], 
        user_id: rand(1..9)
      )
    end
end



def seed_manual_categories
	manuals = Manual.all

	manuals.each do |manual|
		rand(1..4).times do
			ManualCategory.create(
				manual_id: rand(1..4),
				category_id: rand(1..15)
				)
		end
	end
end

# seed_users
# seed_categories
# seed_manuals
# seed_manual_categories