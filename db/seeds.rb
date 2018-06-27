# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'deleting all legislation'
Legislation.destroy_all

puts 'deleting all answers'
Answer.destroy_all

puts 'deleting all questions'
Question.destroy_all

puts 'deleting all clauses'
Clause.destroy_all

puts 'deleting all sections'
Section.destroy_all

puts 'deleting all users'
User.destroy_all

puts "creating user"
User.create!(email: "bobstevens@charitize.com", password: 123456)

puts "creating legislation"
Legislation.create!(title: 'National ICT Innovation and Entrepreneurship Policy Vision', user_id: 1)

puts "creating consultation"
Consultation.create!(legislation_id: 1, user_id: 1)

puts "creating sections"
Section.create!(title: 'Digital Infrastructure', legislation_id: 1)
Section.create!(title: 'R&D', legislation_id: 1)
Section.create!(title: 'Education', legislation_id: 1)

puts "creating clauses"
Clause.create!(content: '1. Mandate infrastructure sharing to achieve the economies of scale necessary for universal affordable access.
  No longer an optional recommendation, Government will support private sector providers to merge their infrastructure.', section_id: 1)
Clause.create!(content: '2. Mandate infrastructure sharing to achieve the economies of scale necessary for universal affordable access.
  No longer an optional recommendation, Government will support private sector providers to merge their infrastructure.', section_id: 1)

Clause.create!(content: '1. Mandate infrastructure sharing to achieve the economies of scale necessary for universal affordable access.
  No longer an optional recommendation, Government will support private sector providers to merge their infrastructure.', section_id: 2)
Clause.create!(content: '2. Mandate infrastructure sharing to achieve the economies of scale necessary for universal affordable access.
  No longer an optional recommendation, Government will support private sector providers to merge their infrastructure.', section_id: 2)

Clause.create!(content: '1. Mandate infrastructure sharing to achieve the economies of scale necessary for universal affordable access.
  No longer an optional recommendation, Government will support private sector providers to merge their infrastructure.', section_id: 3)
Clause.create!(content: '2. Mandate infrastructure sharing to achieve the economies of scale necessary for universal affordable access.
  No longer an optional recommendation, Government will support private sector providers to merge their infrastructure.', section_id: 3)

puts "creating questions"
Question.create!(content: 'Do you feel that this represents your views?', clause_id: 1)
Question.create!(content: 'How well does this push your country in the right direction?', clause_id: 1)
Question.create!(content: 'Would you like to provide a suggestion?', clause_id: 1)

Question.create!(content: 'Do you feel that this represents your views?', clause_id: 2)
Question.create!(content: 'How well does this push your country in the right direction?', clause_id: 2)
Question.create!(content: 'Would you like to provide a suggestion?', clause_id: 2)

Question.create!(content: 'Do you feel that this represents your views?', clause_id: 3)
Question.create!(content: 'How well does this push your country in the right direction?', clause_id: 3)
Question.create!(content: 'Would you like to provide a suggestion?', clause_id: 3)

Question.create!(content: 'Do you feel that this represents your views?', clause_id: 4)
Question.create!(content: 'How well does this push your country in the right direction?', clause_id: 4)
Question.create!(content: 'Would you like to provide a suggestion?', clause_id: 4)

Question.create!(content: 'Do you feel that this represents your views?', clause_id: 5)
Question.create!(content: 'How well does this push your country in the right direction?', clause_id: 5)
Question.create!(content: 'Would you like to provide a suggestion?', clause_id: 5)

Question.create!(content: 'Do you feel that this represents your views?', clause_id: 6)
Question.create!(content: 'How well does this push your country in the right direction?', clause_id: 6)
Question.create!(content: 'Would you like to provide a suggestion?', clause_id: 6)

