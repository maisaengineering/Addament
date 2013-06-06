# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

company = Company.create(company_name: "Maisa Solutions")
company = Company.create(company_name: "Google")
company = Company.create(company_name: "Infosys")
company = Company.create(company_name: "Yahoo")
puts "----------  Created 5 Companies ---------------"
