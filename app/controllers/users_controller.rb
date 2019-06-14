class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    results_user = Result.where(user: @user)
    @average_result = results_user.map { |result| result.score }.inject(0, :+) / results_user.size

  end
end
