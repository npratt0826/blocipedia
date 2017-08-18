require 'random_data'

25.times do 
    Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)
end

25.times do 
    Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, private: true)
end

wikis = Wiki.all

5.times do 
  User.create!(
    email: RandomData.random_email,
    password: RandomData.random_sentence
    )
end
users = User.all

 admin = User.create!(
   email: 'admin@example.com',
   password: 'helloworld',
   role: 'admin'
 )
 
 member = User.create!(
   email:    'member@example.com',
   password: 'helloworld',
   role: "standard"
   
 )
 
 premium = User.create!(
   email:    'premium@example.com',
   password: 'helloworld',
   role: "premium"
   
 )

puts "#{User.count} users created"
puts "Seed finished"
puts "#{Wiki.count} wikis created"
