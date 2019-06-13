class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    # puts "*"*20, params, "*"*20
    # if params[:user][:date_of_birth] != nil
    # if params[:user][:date_of_birth]#.method_defined? :to_date
    if params['controller'] == 'devise/registrations'
      if params['action'] == 'create' || params['action'] == 'update'
        params[:user][:date_of_birth] = params[:user][:date_of_birth].to_date
      end
    end
    # end
    # end
    # puts "*"*20, params[:user][:date_of_birth].class, "*"*20
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :date_of_birth, :gender)}
    # devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :is_alive, :email, :password, :password_confirmation, :avatar, :birthday)}
<<<<<<< HEAD
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :date_of_birth, :gender, :avatar, :is_admin?, :admin, :level_id)}

=======
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :date_of_birth, :gender, :avatar, :i_sadmin?, :level_id)}
>>>>>>> 51504e1cc4eeeb6686cb825ac6c07aafb1ed6e9b
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
