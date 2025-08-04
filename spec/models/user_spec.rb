require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create!(name: "Andre") }

  describe "validations" do
    it "is valid with a name" do
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      invalid_user = User.new
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors[:name]).to include("can't be blank")
    end
  end

  describe "associations" do
    it "has many sleep_records" do
      assoc = described_class.reflect_on_association(:sleep_records)
      expect(assoc.macro).to eq(:has_many)
    end

    it "has many follows" do
      assoc = described_class.reflect_on_association(:follows)
      expect(assoc.macro).to eq(:has_many)
    end

    it "has many followings through follows" do
      assoc = described_class.reflect_on_association(:followings)
      expect(assoc.macro).to eq(:has_many)
      expect(assoc.options[:through]).to eq(:follows)
    end

    it "has many reverse_follows" do
      assoc = described_class.reflect_on_association(:reverse_follows)
      expect(assoc.macro).to eq(:has_many)
    end

    it "has many followers through reverse_follows" do
      assoc = described_class.reflect_on_association(:followers)
      expect(assoc.macro).to eq(:has_many)
      expect(assoc.options[:through]).to eq(:reverse_follows)
    end
  end
end
