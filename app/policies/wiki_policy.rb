class WikiPolicy < ApplicationPolicy
    def destroy?
        user.admin? || record.user_id == user.id
    end
    
    def edit?
        user.present?
    end
  
    class Scope
     attr_reader :user, :scope
 
     def initialize(user, scope)
       @user = user
       @scope = scope
     end
     
 
     def resolve
      if @user.admin? || @user.premium?
        return @scope.all
      elsif @user.standard?
        return @scope.joins(:collaborators).where(collaborators: {user_id: @user.id}) + @scope.where(private: nil)
      else
        return @scope.none
      end
     end
    end
    #   wikis = []
    #   if user.role == 'admin'
    #      wikis = scope.all # if the user is an admin, show them all the wikis
    #   elsif user.role == 'premium'
    #      all_wikis = scope.all
    #      all_wikis.each do |wiki|
    #       if wiki.public? || wiki.owner == user || wiki.collaborators.include?(user)
    #          wikis << wiki # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
    #       end
    #      end
    #   else # this is the lowly standard user
    #      all_wikis = scope.all
    #      wikis = []
    #      all_wikis.each do |wiki|
    #       if wiki.public? || wiki.collaborators.include?(user)
    #          wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
    #       end
    #      end
    #   end
    #   wikis # return the wikis array we've built up
    #  end
    # end
        
    
    
end
