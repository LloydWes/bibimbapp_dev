class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    # if params['controller'] == 'devise/registrations'
    #   if params['action'] == 'create' || params['action'] == 'update'
    #     params[:user][:date_of_birth] = params[:user][:date_of_birth].to_date
    #   end
    # end
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :date_of_birth, :gender)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :gender, :avatar, :is_admin?, :admin, :level_id)}

  end

  protected

  def after_sign_in_path_for(resource)
    # return the path based on resource
    lessons_path
  end

  def after_sign_out_path_for(resource)
    # return the path based on resource
    root_path
  end
end
