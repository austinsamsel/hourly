require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.create!(email: "me@home.com", password: "watching the telly")
  end

  test "associated clients should be destroyed" do
    @user.save
    @user.clients.create!(name: "Lorem ipsum")
    assert_difference 'Client.count', -1 do
      @user.destroy
    end
  end

end
