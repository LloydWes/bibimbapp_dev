class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @lessons = Lesson.all

    results_user = Result.where(user: @user)
    results_user.empty? ? @average_result = nil : @average_result = results_user.map { |result| result.score }.inject(0, :+) / results_user.size

    passed_tests = 0
    @lessons.each do |lesson|
      lesson_results = results_user.select {|result| result.lesson_id == lesson.id}
      passed_tests +=1 unless (lesson_results.empty?)
    end
    @average_passed_tests = passed_tests / @lessons.size
end
end
 # && result.is_past?
