class Users::RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    profiles_path
  end

  def after_update_path_for(resource)
    flash[:notice] = "User has been successfully updates!"
    profiles_path
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "User has been successfully deleted!"
    root_path
  end
end