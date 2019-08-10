# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
puts "deleting general feedbacks"
GeneralFeedback.destroy_all

puts 'deleting all answers'
Answer.destroy_all

puts 'deleting all questions'
Question.destroy_all

puts 'deleting metadata'
Metadatum.destroy_all

puts 'deleting articles'
Article.destroy_all

puts 'deleting all chapters'
Chapter.destroy_all

puts 'deleting all titles'
Title.destroy_all

puts 'deleting all consultation'
Consultation.destroy_all

puts 'deleting all legislation'
Legislation.destroy_all

puts 'destroy admin users'
AdminUser.destroy_all

puts 'deleting all users'
User.destroy_all

puts "creating users"
user = User.create!(email: "bobstevens@charitize.com", password: 123456)
User.create!(email: "user2@charitize.com", password: 123456)
User.create!(email: "user3@charitize.com", password: 123456)
User.create!(email: "user4@charitize.com", password: 123456)
User.create!(email: "user5@charitize.com", password: 123456)
User.create!(email: "user6@charitize.com", password: 123456)

puts "creating admin users"
AdminUser.create!(email:"admin@charitize.com", password: 123456)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

puts "creating legislation"
l = Legislation.create!(
title: 'Constitución Política de la República de Panamá',
introduction: "Reformada por los Actos Reformatorios de 1978, el Acto Constitucional de 1983 y los Actos Legislativos de 1994..",
user: user)

puts "creating consultation"
Consultation.create!(legislation: l, user: user)

# t -> titles, c -> chapters, a -> articles, m -> metadata

puts "creating title 1"
t1 = Title.create!(number: 1,
  description: "El Estado Panameño",
  legislation: l)

  puts 'creating chapter 1'
  c1 = Chapter.create!(number: 1,
    description: "Hello from chapter 1",
    title: t1)

    puts 'creating article 1'
    a1 = Article.create!(content: 'La Nación panameña está organizada en Estado soberano e independiente, cuya denominación es República de Panamá. Su gobierno es unitario, republicano, democrático y representativo.',
      chapter: c1,
      number: 1)

      puts 'creating metadata for article 1'
      m1 = Metadatum.create!(content: "Antes esto se mencionaba en el articulo x del titulo x.",
        article: a1)

    puts 'creating article 2'

    a2 = Article.create!(content: 'El Poder Público sólo emana del pueblo. Lo ejerce el Estado conforme esta Constitución lo establece, por medio de los Órganos Legislativo, Ejecutivo y Judicial, los cuales actúan limitada y separadamente, pero en armónica colaboración',
      chapter: c1,
      number: 2)

      puts 'creating metadata for article 2'
      m2 = Metadatum.create!(content: "Antes esto se mencionaba en el articulo x del titulo x.",
        article: a2)

    puts 'creating article 3'

    a3 = Article.create!(content: 'El territorio de la República de Panamá comprende la superficie terrestre, el mar territorial, la plataforma continentalsubmarina, el subsuelo y el espacio aéreo entre Colombia y Costa Rica de acuerdo con los tratados de limites celebrados por Panamá y esos Estados. El territorio nacional no podrá ser jamás cedido, traspasado o enajenado, ni temporal ni parcialmente, a otros Estados.',
      chapter: c1,
      number: 3)

    puts 'creating article 4'

    a4 = Article.create!(content: 'La República de Panamá acata las normas del Derecho Internacional.',
      chapter: c1,
      number: 4)

    puts 'creating article 5'

    a5 = Article.create!(content: 'El  territorio  del  Estado  panameño  se  divide  políticamente  en Provincias, éstas a su vez en Distritos y los Distritos en Corregimientos. La ley podrá crear otras divisiones políticas, ya sea para sujetarlas a regímenes especiales o por razones de conveniencia administrativa o de servicio público. ',
      chapter: c1,
      number: 5)

    puts 'creating article 6'

    a6 = Article.create!(content: 'Los símbolos de la Nación son: el himno, la bandera y el escudo de armas, adoptados por la Ley 34 de 1949. ',
    chapter: c1,
    number: 6)

    puts 'creating article 7'

    a7 = Article.create!(content: 'El español es el idioma oficial de la República.',
    chapter: c1,
    number: 7)


puts 'Creating questions for each article'
Article.all.each do |article|
  Question.create!(content: "Pregunta de prueba1", article: article)
  Question.create!(content: "Pregunta de prueba2", article: article)
  Question.create!(content: "Tienes alguna sugerencia?", article: article)
end
