class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @lessons = Lesson.all

    results_user = Result.where(user: @user)
    results_user.empty? ? @average_result = nil : @average_result = results_user.map { |result| result.score }.inject(0, :+) / results_user.size

    # average_passed_tests_total
    passed_tests = 0
    @lessons.each do |lesson|
      lesson_results = results_user.select {|result| result.lesson == lesson && result.is_past?}
      passed_tests +=1 unless (lesson_results.empty?)
    end
    @average_passed_tests_total = 100 * passed_tests / @lessons.size

    # average_passed_tests_A1
    passed_tests = 0
    lessonsA1 = @lessons.select {|lesson| lesson.level.niveau == "A1"}
    lessonsA1.each do |lesson|
      lesson_results = results_user.select {|result| result.lesson == lesson && result.is_past?}
      passed_tests +=1 unless (lesson_results.empty?)
    end
    @average_passed_tests_A1 = 100 * passed_tests / lessonsA1.size

    # average_passed_tests_A2
    passed_tests = 0
    lessonsA2 = @lessons.select {|lesson| lesson.level.niveau == "A2"}
    lessonsA2.each do |lesson|
      lesson_results = results_user.select {|result| result.lesson == lesson && result.is_past?}
      passed_tests +=1 unless (lesson_results.empty?)
    end
    @average_passed_tests_A2 = 100 * passed_tests / lessonsA2.size

    # average_passed_tests_B1
    passed_tests = 0
    lessonsB1 = @lessons.select {|lesson| lesson.level.niveau == "B1"}
    lessonsB1.each do |lesson|
      lesson_results = results_user.select {|result| result.lesson == lesson && result.is_past?}
      passed_tests +=1 unless (lesson_results.empty?)
    end
    @average_passed_tests_B1 = 100 * passed_tests / lessonsB1.size

    # average_passed_tests_B2
    passed_tests = 0
    lessonsB2 = @lessons.select {|lesson| lesson.level.niveau == "B2"}
    lessonsB2.each do |lesson|
      lesson_results = results_user.select {|result| result.lesson == lesson && result.is_past?}
      passed_tests +=1 unless (lesson_results.empty?)
    end
    @average_passed_tests_B2 = 100 * passed_tests / lessonsB2.size

  end
end
