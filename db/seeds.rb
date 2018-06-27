# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'deleting all consultation'
Consultation.destroy_all

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
User.create!(email: "user2@charitize.com", password: 123456)
User.create!(email: "user3@charitize.com", password: 123456)
User.create!(email: "user4@charitize.com", password: 123456)
User.create!(email: "user5@charitize.com", password: 123456)
User.create!(email: "user6@charitize.com", password: 123456)

puts "creating admin user"
AdminUser.create!(email:"admin@charitize.com", password: 123456)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

puts "creating legislation"
Legislation.create!(title: 'National ICT Innovation and Entrepreneurship Policy Vision', user_id: 1)
Legislation.create!(title: 'National ICT Innovation and Entrepreneurship Policy Vision', user_id: 2)
Legislation.create!(title: 'National ICT Innovation and Entrepreneurship Policy Vision', user_id: 3)
Legislation.create!(title: 'National ICT Innovation and Entrepreneurship Policy Vision', user_id: 4)
Legislation.create!(title: 'National ICT Innovation and Entrepreneurship Policy Vision', user_id: 5)
Legislation.create!(title: 'National ICT Innovation and Entrepreneurship Policy Vision', user_id: 6)

puts "creating consultation"
Consultation.create!(legislation_id: 1, user_id: 1)
Consultation.create!(legislation_id: 2, user_id: 2)
Consultation.create!(legislation_id: 3, user_id: 3)
Consultation.create!(legislation_id: 4, user_id: 4)
Consultation.create!(legislation_id: 5, user_id: 5)
Consultation.create!(legislation_id: 6, user_id: 6)

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
Question.create!(content: 'How well does this push your country in the direction?', clause_id: 1)
Question.create!(content: 'Would you like to provide a suggestion?', clause_id: 1)
Question.create!(content: 'Please suggest a revision', clause_id: 1)

Question.create!(content: 'Do you feel that this represents your views?', clause_id: 2)
Question.create!(content: 'How well does this push your country in the direction?', clause_id: 2)
Question.create!(content: 'Would you like to provide a suggestion?', clause_id: 2)
Question.create!(content: 'Please suggest a revision', clause_id: 2)

Question.create!(content: 'Do you feel that this represents your views?', clause_id: 3)
Question.create!(content: 'How well does this push your country in the direction?', clause_id: 3)
Question.create!(content: 'Would you like to provide a suggestion?', clause_id: 3)
Question.create!(content: 'Please suggest a revision', clause_id: 3)

Question.create!(content: 'Do you feel that this represents your views?', clause_id: 4)
Question.create!(content: 'How well does this push your country in the direction?', clause_id: 4)
Question.create!(content: 'Would you like to provide a suggestion?', clause_id: 4)
Question.create!(content: 'Please suggest a revision', clause_id: 4)

Question.create!(content: 'Do you feel that this represents your views?', clause_id: 5)
Question.create!(content: 'How well does this push your country in the direction?', clause_id: 5)
Question.create!(content: 'Would you like to provide a suggestion?', clause_id: 5)
Question.create!(content: 'Please suggest a revision', clause_id: 5)

Question.create!(content: 'Do you feel that this represents your views?', clause_id: 6)
Question.create!(content: 'How well does this push your country in the direction?', clause_id: 6)
Question.create!(content: 'Would you like to provide a suggestion?', clause_id: 6)
Question.create!(content: 'Please suggest a revision', clause_id: 6)

puts "creating dummy general feedback"
GeneralFeedback.create!(content: 'My custom feedback - User 1', consultation_id: 1)
GeneralFeedback.create!(content: 'I really like it because...', consultation_id: 2)
GeneralFeedback.create!(content: 'I totally disagree becasue', consultation_id: 3)
GeneralFeedback.create!(content: 'My custom feedback - User 4', consultation_id: 4)
GeneralFeedback.create!(content: 'My custom feedback - User 5', consultation_id: 5)
GeneralFeedback.create!(content: 'My custom feedback xyz - User 6', consultation_id: 6)

puts "creating dummy answers"
Answer.create!(content: 'yes', question_id: 1, user_id: 1)
Answer.create!(content: 'My custom feedback', question_id: 2, user_id: 1)
Answer.create!(content: 'My custom feedback', question_id: 3, user_id: 1)

Answer.create!(content: 'no', question_id: 4, user_id: 1)
Answer.create!(content: 'My custom feedback', question_id: 5, user_id: 1)
Answer.create!(content: 'My custom feedback', question_id: 6, user_id: 1)

