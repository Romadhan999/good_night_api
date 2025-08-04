require 'rails_helper'

RSpec.describe Follow, type: :model do
  let!(:user1) { User.create!(name: "Andre") }
  let!(:user2) { User.create!(name: "Sule") }

  it "is valid with a follower and followed user" do
    follow = Follow.new(follower: user1, followed: user2)
    expect(follow).to be_valid
  end

  it "is invalid without a follower" do
    follow = Follow.new(followed: user2)
    expect(follow).not_to be_valid
  end

  it "is invalid without a followed user" do
    follow = Follow.new(follower: user1)
    expect(follow).not_to be_valid
  end
end
