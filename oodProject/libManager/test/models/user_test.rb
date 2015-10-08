require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

def setup
	@user = User.new(email:"abc@gmail.com", name:"abc", ty:"0", age:"11", sex:"", pn:"9876543210", password:"123456")
end



  # TEST - Validation of entries
	
	test "name test" do
  		@user.name = ''
  		assert_not @user.valid?
	end

  test "email address" do
    @user.email = ''
    assert_not @user.valid?
  end

  test "password entry" do
    @user.password = ''
    @user.password_confirmation = ''
    assert_not @user.valid?
  end

  # TEST : Alpha-numeric test

  test "name, password and email can be alphanumeric" do
    @user.name = 'abc123'
    @user.password = 'abc123'
    @user.password_confirmation = 'abc123'
    @user.email = 'xyz@ncsu.edu'
    assert @user.valid?
  end

  # TEST : field test

  test "name should be less than 50 characters" do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test "password should be less than 40 characters" do
    @user.password = 'a' * 41
    @user.password_confirmation = 'a' * 41
    assert_not @user.valid?
  end


  test "password should be not be less than 6 characters" do
    @user.password = 'abc123'
    @user.password_confirmation = 'abc123'
    assert @user.valid?
  end

  test "name can have whitespace" do
    @user.name = "abc xyz"
    assert_not @user.valid?, "is valid"
  end



  # TEST : Email validation

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert_not @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be unique even if case is changed" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

end
