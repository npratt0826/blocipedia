class WikiPolicy < ApplicationPolicy
    def destroy?
        user.admin? || record.user_id == user.id
    end
    
    def index?
        if user.admin? || user.premium? 
            @wikis = Wiki.all
        else
            @wikis = Wiki.find_by private: false
        end
    end
        
    
    
end