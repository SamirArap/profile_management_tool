class Users::SessionsController < Devise::SessionsController

  before_action :authenticate_user!

  protected
   def after_sign_in_path_for(resource)
     profiles_path
   end

  def after_sing_out_path_for(resource)
    profiles_path
  end
end