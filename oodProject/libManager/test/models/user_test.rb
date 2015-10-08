require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "abc", email: "abcxyz@gmail.com", password: "12345678", password_confirmation: "12345678", ty: 2)
  end

  test "furst name" do
    @user.name = ''
    assert_not @user.valid?
  end
end
