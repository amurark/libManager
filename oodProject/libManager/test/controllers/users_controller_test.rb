require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
  @user = User.new(email:"abc@gmail.com", name:"abc", ty:"0", age:"11", sex:"", pn:"9876543210", password:"123456")
  end

  test "should get index" do
    get :index
    assert_response :success
    #assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end
end
