# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"

Customer.destroy_all
Flower.destroy_all
Category.destroy_all
Province.destroy_all
CartItem.destroy_all
Order.destroy_all


AdminUser.destroy_all

filename = Rails.root.join("db/flowers.csv")
puts "Loading Flowers from the CSV file: #{filename}"

csv_data = File.read(filename)
flowers = CSV.parse(csv_data, headers: true, encoding: "ISO-8859-1")

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

Province.create(name: 'Alberta', pst: 0, gst: 0.05, hst: 0)
Province.create( name: 'British Columbia', pst: 0.07, gst: 0.05, hst: 0)
Province.create(name:   'Manitoba', pst:    0.07, gst:    0.05, hst:    0)
Province.create( name:   'New Brunswick', pst:    0, gst:    0, hst:    0.15)
Province.create( name:   'Newfoundland and Labrador', pst:    0, gst:    0, hst:    0.15)
Province.create( name:   'Northwest Territories', pst:    0, gst:    0.05, hst:    0)
Province.create( name:   'Nova Scotia', pst:    0, gst:    0, hst:    0.15)
Province.create( name:   'Nunavut', pst:    0, gst:    0.05, hst:    0)
Province.create( name:   'Ontario', pst:    0, gst:    0, hst:    0.13)
Province.create( name:   'Prince Edward Island', pst:    0, gst:    0, hst:    0.15)
Province.create( name:   'Quebec', pst:    0.0975, gst:    0.05, hst:    0)
Province.create( name:   'Saskatchewan', pst:    0.06, gst:    0.05, hst:    0)
Province.create( name:   'Yukon', pst:    0, gst:    0.05, hst:    0)

puts "Created #{Province.count} Provinces"
puts "Created #{Category.count} Categories"
puts "Created #{Flower.count} Flowers"

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

