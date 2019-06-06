require "application_system_test_case"

class StaticsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit statics_url
  #
  #   assert_selector "h1", text: "Static"
  # end
  test "index_screen_shot" do
    visit root_path
    take_screenshot

  end
end
