module WikisHelper
    
    def public?
       wiki.private == nil 
    end
    
    def owner
       wiki.user_id
    end
    
end
