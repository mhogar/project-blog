require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(email: "user@example.com", password: "password", user_name: "user")
  end
  
  test "user is valid" do
    assert @user.valid?
  end
  
  test "user name should be present" do
    @user.user_name = nil
    assert_not @user.valid?
  end
  
  test "user name should be unique" do
    user2 = User.new(email: "user2@example.com", password: "password", user_name: "user")
    user2.save
    
    assert_not @user.valid?
  end
  
  test "user name should not be too short" do
    @user.user_name = "a"
    assert_not @user.valid?
  end
  
  test "user name should not be too long" do
    @user.user_name = "a" * (get_validation_max(User, :user_name) + 1)
    assert_not @user.valid?
  end
  
  test "user name should be of the correct format" do
    @user.user_name = "user*;%@${]?<>.,"
    assert_not @user.valid?
  end
end
