class User < ApplicationRecord
  has_many :wikis, dependent: :destroy
  has_many :collaborators, dependent: :destroy
  has_many :shared_wikis, through: :collaborators, source: :wiki
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  before_save { self.email = email.downcase if email.present? }
         
  after_initialize :init, :if => :new_record?
  
  enum role: [:standard, :premium, :admin]
  
  
  def init
    self.role ||= :standard
  end
  
  def collaborators
     Collaborator.where(user_id: id)
  end
  
end

