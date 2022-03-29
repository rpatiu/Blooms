# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"

Category.destroy_all
Flower.destroy_all
CartItem.destroy_all
Order.destroy_all
Customer.destroy_all
Province.destroy_all
AdminUser.destroy_all

filename = Rails.root.join("db/flowers.csv")
puts "Loading Flowers from the CSV file: #{filename}"

csv_data = File.read(filename)
flowers = CSV.parse(csv_data, headers: true, encoding: "utf-8")

flowers.each do |f|

  category = Category.find_or_create_by(name: f["category"])

  if category && category.valid?
    flower = category.flowers.create(
      name:         f["name"],
      description:  f["description"],
      price:        f["price"],
      sale_price:   f["sale_price"]
    )

    unless flower.valid?
      puts "Invalid flower #{f['name']}"
    end

  else
    puts "Invalid category #{f['category']} for flower #{f['name']}"
  end
end

puts "Created #{Category.count} Categories"
puts "Created #{Flower.count} Flowers"

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?