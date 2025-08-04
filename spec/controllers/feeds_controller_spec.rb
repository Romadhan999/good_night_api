require 'rails_helper'

RSpec.describe "Feeds API", type: :request do
  let!(:user) { User.create!(name: "Andre") }
  let!(:friend1) { User.create!(name: "Sule") }
  let!(:friend2) { User.create!(name: "Cleopatra") }

  before do
    post "/follow/#{friend1.id}", params: { user_id: user.id }
    post "/follow/#{friend2.id}", params: { user_id: user.id }

    SleepRecord.create!(user: friend1, start_time: 5.hours.ago, end_time: Time.current)
    SleepRecord.create!(user: friend2, start_time: 3.hours.ago, end_time: Time.current)
  end

  it 'returns sleep records of following users from last week sorted by duration desc' do
    get "/feed", params: { user_id: user.id }
    expect(response).to have_http_status(:ok)
    json = JSON.parse(response.body)
    expect(json).to be_an(Array)
    expect(json.size).to eq(2)
  end
end
