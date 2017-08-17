class Wiki < ApplicationRecord
  belongs_to :user
  
  def downgrade_wikis_to_public
      
  end
  
end
