require 'rails_helper'

RSpec.describe "SleepRecords API", type: :request do
  let!(:user) { User.create!(name: "Andre") }

  it 'creates a clock-in record' do
    post "/sleep_records", params: { user_id: user.id }
    expect(response).to have_http_status(:created)
    expect(JSON.parse(response.body)).not_to be_empty
  end
end
