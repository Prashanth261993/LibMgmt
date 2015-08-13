class AdminPolicy 
  attr_reader :user

  def initialize(user)
    @user = user
    
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  def is_admin?
  	 user.usertype == 1
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user,scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.usertype == 1
      	scope = scope.all

    end
  end

end