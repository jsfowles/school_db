require 'test_helper'

class SchoolsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get showedit" do
    get :showedit
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
