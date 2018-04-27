require 'test_helper'

class UserProfileTest < ActiveSupport::TestCase
  
  def setup
    @profile = UserProfile.new(about: "The About Blurb", first_name: "Name", last_name: "Name", occupation: "Job", user_id: 1)
  end
  
  test "profile is valid" do
    assert @profile.valid?
  end
  
  test "about does not need to be present" do
    @profile.about = nil
    assert @profile.valid?
  end
  
  test "about is not too short" do
    @profile.about = "a"
    assert_not @profile.valid?
  end
  
  test "about is not too long" do
    @profile.about = "a" * (get_validation_max(UserProfile, :about) + 1)
    assert_not @profile.valid?
  end
  
  test "first_name does not need to be present" do
    @profile.first_name = nil
    assert @profile.valid?
  end
  
  test "first_name is not too long" do
    @profile.first_name = "a" * (get_validation_max(UserProfile, :first_name) + 1)
    assert_not @profile.valid?
  end
  
  test "last_name does not need to be present" do
    @profile.last_name = nil
    assert @profile.valid?
  end
  
  test "last_name is not too long" do
    @profile.last_name = "a" * (get_validation_max(UserProfile, :last_name) + 1)
    assert_not @profile.valid?
  end
  
  test "occupation does not need to be present" do
    @profile.occupation = nil
    assert @profile.valid?
  end
  
  test "occupation is not too long" do
    @profile.occupation = "a" * (get_validation_max(UserProfile, :occupation) + 1)
    assert_not @profile.valid?
  end
  
  test "user_id must be present" do
    @profile.user_id = nil
    assert_not @profile.valid?
  end
end
