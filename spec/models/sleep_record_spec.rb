require 'rails_helper'

RSpec.describe SleepRecord, type: :model do
  let!(:user) { User.create!(name: "Andre") }

  describe "associations" do
    it "belongs to a user" do
      assoc = described_class.reflect_on_association(:user)
      expect(assoc.macro).to eq(:belongs_to)
    end
  end

  describe "validations" do
    it "is valid with a user and start_time" do
      record = SleepRecord.new(user: user, start_time: Time.current)
      expect(record).to be_valid
    end

    it "is invalid without a start_time" do
      record = SleepRecord.new(user: user)
      expect(record).not_to be_valid
      expect(record.errors[:start_time]).to include("can't be blank")
    end

    it "is invalid without a user" do
      record = SleepRecord.new(start_time: Time.current)
      expect(record).not_to be_valid
      expect(record.errors[:user]).to include("must exist")
    end
  end

  describe "callbacks" do
    it "calculates duration only when end_time is present" do
      start_time = 5.hours.ago
      end_time = Time.current

      record = SleepRecord.create!(user: user, start_time: start_time, end_time: end_time)
      expect(record.duration).to eq((end_time - start_time).to_i)
    end

    it "leaves duration as nil when end_time is missing" do
      record = SleepRecord.create!(user: user, start_time: Time.current)
      expect(record.duration).to be_nil
    end

    it "updates duration when end_time is later added" do
      record = SleepRecord.create!(user: user, start_time: 3.hours.ago)
      record.update!(end_time: Time.current)
      expect(record.duration).to eq((record.end_time - record.start_time).to_i)
    end
  end
end
