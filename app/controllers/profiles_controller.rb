class ProfilesController < ApplicationController

  def index
    unless current_user.login.blank?
      @login = current_user.login
      rest_client = RestClient.new

      @github_user = rest_client.get_user(@login)

      @github_user.each do |user|
        if user.id
          @github_user_reposes = rest_client.get_repos(@login)
          @my_repositories = Kaminari.paginate_array(@github_user_reposes).page(params[:page]).per(5)
        else
          flash[:alert] = "You didn't write a valid github username!"
          redirect_to edit_user_registration_path
        end
      end
    end

  end
end