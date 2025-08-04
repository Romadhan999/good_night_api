# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all

u1 = User.create!(name: "Andre")
u2 = User.create!(name: "Sule")
u3 = User.create!(name: "Cleopatra")

SleepRecord.create!(user: u1, start_time: 9.hours.ago, end_time: 1.hour.ago)
SleepRecord.create!(user: u2, start_time: 8.hours.ago, end_time: 1.hour.ago)
SleepRecord.create!(user: u3, start_time: 7.hours.ago, end_time: 30.minutes.ago)
