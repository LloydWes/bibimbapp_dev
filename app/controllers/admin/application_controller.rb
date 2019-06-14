# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    # before_action :authenticate_admin
    # before_action :authenticate_user!

    before_action do
      unless user_signed_in?
        #flash[:danger] = "Access forbiden"
        redirect_to root_path 
      else
      redirect_to root_path unless current_user.is_admin?
      end
    end

    def authenticate_admin
      current_user.is_admin?
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
