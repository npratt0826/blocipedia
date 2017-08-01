require 'random_data'

25.times do 
    Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)
end

wikis = Wiki.all

5.times do 
  User.create!(
    email: RandomData.random_email,
    password: RandomData.random_sentence
    )
end
users = User.all

puts "#{User.count} users created"
puts "Seed finished"
puts "#{Wiki.count} wikis created"
