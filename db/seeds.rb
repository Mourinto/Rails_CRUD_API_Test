# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Sacramentorealestatetransactions.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  t = Transaction.new
  t.street = row['street']
  t.city = row['city']
  t.zip = row['zip']
  t.state = row['state']
  t.beds = row['beds']
  t.baths = row['baths']
  t.sq__ft = row['sq__ft']
  t.type = row['type']
  t.sale_date = row['sale_date']
  t.price = row['price']
  t.latitude = row['latitude']
  t.longitude = row['longitude']
  t.save
end

