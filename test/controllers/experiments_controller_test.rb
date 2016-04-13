require 'test_helper'

class ExperimentsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get preview" do
    get :preview
    assert_response :success
  end

  test "should get success" do
    get :success
    assert_response :success
  end

end
