source 'https://rubygems.org'
 
 # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
  git_source(:github) do |repo_name|
   repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
   "https://github.com/#{repo_name}.git"
 end



 # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
 gem 'jbuilder', '~> 2.5'
 
 group :development do
   gem 'listen', '~> 3.0.5'
 end
 
 
 #old CODE BELOW
 
 gem 'rails', '4.2.5'
 
 group :production do
   gem 'pg'
   gem 'rails_12factor'
 end
 
 group :development do
   gem 'sqlite3'
   gem 'web-console', '~> 2.0'
 end
 
 gem 'sass-rails', '~> 5.0'
 gem 'uglifier', '>= 1.3.0'
 gem 'coffee-rails', '~> 4.1.0'
 gem 'jquery-rails'
 gem 'turbolinks'
 gem 'figaro'

 group :development, :test do
   gem 'byebug'
   gem 'spring'
   gem 'rspec-rails'
   gem 'rails-controller-testing'
   gem 'shoulda'
   gem 'faker'
   gem 'factory_girl_rails'
   gem 'pry-rails'
 end
 
 gem 'bootstrap-sass'
 gem 'devise'
 gem 'pundit'
 