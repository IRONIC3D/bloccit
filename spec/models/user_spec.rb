require 'rails_helper'

describe User do
  describe ".top_rated" do
    before :each do
      @user1 = create(:user)
      post = create(:post, user: @user1)
      create(:comment, user: @user1, post: post)

      @user2 = create(:user)
      post = create(:post, user: @user2)
      2.times { create(:comment, user: @user2, post: post) }
    end

    it "should return users based on comments + posts" do
      expect(User.top_rated).to eq([@user2, @user1])
    end

    it "should have 'post_count' on user" do
      users = User.top_rated
      expect(users.first.posts_count).to eq(1)
    end

    it "should have 'comments_count' on user" do
      users = User.top_rated
      expect(users.first.comments_count).to eq(2)
    end
  end

  describe "#role" do
    before :each do
      @user3 = create(:admin)
      @user4 = create(:user)
    end
    it "should return true user role admin" do
      expect(@user3.role?(:admin)).to eq(true)
    end

    it "shoudl return false for user role moderator" do
      expect(@user4.role?(:moderator)).to eq(false)
    end
  end

  describe "#favorited" do
  end

  describe "#voted" do
  end
end