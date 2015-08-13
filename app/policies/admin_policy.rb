class AdminPolicy 
  attr_reader :user

  def initialize(user)
    @user = user
    
  end



  def is_admin?
  	 user.usertype == 1
  end
end