# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = %w(Art Comics Crafts Dance Community Fashion Film Video Food Games Music Photography Publishing Technology Theater)
categories.each do |category|
  Category.find_or_create_by!(name: category)
end

User.create(email: 'user@crowdpouch.com', user_name: 'crowdpouch', name: 'user1', password: "12345678")