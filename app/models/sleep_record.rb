class SleepRecord < ApplicationRecord
  belongs_to :user

  validates :start_time, presence: true

  before_save :calculate_duration

  private

  def calculate_duration
    self.duration = (end_time - start_time).to_i if end_time.present?
  end
end
