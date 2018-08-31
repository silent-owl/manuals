# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  config.current_user_method = 'current_user'
  
end


Merit::Badge.create!(
  id: 1,
  name: "First manual",
  description: "Create first manual",
  custom_fields: { image_url: "https://png.icons8.com/metro/1600/medal2.png" }
  )
Merit::Badge.create!(
  id: 2,
  name: "Experienced assistant",
  description: "Create 10 manuals",
  custom_fields: { image_url: "http://freevector.co/wp-content/uploads/2014/07/49965-sportive-medal-symbol-with-a-star.png" }
  )
Merit::Badge.create!(
  id: 3,
  name: "ManuALLman",
  description: "Create 20 manuals",
  custom_fields: { image_url: "http://freevector.co/wp-content/uploads/2014/07/31638-star-medal-with-ribbon.png" }
  )


# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end
