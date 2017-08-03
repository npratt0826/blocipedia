class WikiPolicy < ApplicationPolicy
 
    
    def destroy?
        user.admin? || record.user_id == user.id
    end
    
    
end