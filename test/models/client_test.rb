require 'test_helper'

class ClientTest < ActiveSupport::TestCase

  def setup
    @user = User.create!(email: "me@home.com", password: "watching the telly")
    @client = @user.clients.build(name: "the company")
  end

  test "should be valid" do
    assert @client.valid?
  end

  test "user id should be present" do
    @client.user_id = nil
    assert_not @client.valid?
  end

  test "name should be present" do
    @client.name = "     "
    assert_not @client.valid?
  end

  test "client should be at most 100 characters" do
    @client.name = "a" * 101
    assert_not @client.valid?
  end

  test "order should be most recent first" do
    assert_equal Client.first, clients(:most_recent)
  end

end


  # let :user do
  #   User.create!(email: "me@home.com", password: "watching the telly")
  # end

  # before { sign_in user }

  # context "creating a client" do
  #   client :create, name: 'of company'

  #   expect(assigns(:client)).to be_instance_of Client

  #   expect(:client.try :name).to eq 'of company'

  #   expect(:client.try :user).to eq user
  # end