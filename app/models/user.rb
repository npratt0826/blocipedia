class User < ActiveRecord::Base
  has_many :wikis, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  after_initialize :init, :if => :new_record?
  
  enum role: [:standard, :premium, :admin]
  
  def init
    self.role ||= :standard
    
  end
  
end
