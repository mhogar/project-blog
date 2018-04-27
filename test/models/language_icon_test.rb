require 'test_helper'

class LanguageIconTest < ActiveSupport::TestCase
  
  def setup
    @icon = LanguageIcon.new(image: "image.png")
  end
  
  test "language icon is valid" do
    #FIX
    assert @icon.valid?
  end
  
  test "image is present" do
    @icon.image = nil
    assert_not @icon.valid?
  end
end
