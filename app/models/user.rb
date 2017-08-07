class User < ApplicationRecord
  has_many :wikis, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  before_save { self.email = email.downcase if email.present? }
         
  after_initialize :init, :if => :new_record?
  
  enum role: [:standard, :premium, :admin]
  
  
  def init
    self.role ||= :standard
    puts "init user role to standard"
  end
  
  
end
