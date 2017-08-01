class User < ActiveRecord::Base
  has_many :wikis, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  after_initialize :init, :if => :new_record?
  
  enum role: [:standard, :premium, :admin]
  
  # USER_ROLES = {
  #   :admin => 0,
  #   :standard => 10,
  #   :premium => 20
  # }
  
  def init
    self.role ||= :standard
  end
  
  def set_as_admin
    self.role = :admin
  end
  
  def set_as_premium
    self.role = :premium
  end
  
  def set_as_standard
    self.role = :standard
  end
  
  def can_destroy?(wiki)
    true if owns?(wiki) || admin?
  end
  
  def owns?(wiki)
    true if self.id == wiki.user_id
  end
  
  def admin?
    true if self.role == :admin
    
  end
  
  # def role_name
  #   User.user_roles.key(self.role)
  # end
  
  # def self.user_roles
  #   enum role
  # end
  
  
  
end
