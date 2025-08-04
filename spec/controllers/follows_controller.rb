require 'rails_helper'

RSpec.describe "Follows API", type: :request do
  let!(:user) { User.create!(name: "Andre") }
  let!(:friend) { User.create!(name: "Sule") }

  it 'allows follow and unfollow' do
    post "/follow/#{friend.id}", params: { user_id: user.id }
    expect(response).to have_http_status(:no_content)

    delete "/unfollow/#{friend.id}", params: { user_id: user.id }
    expect(response).to have_http_status(:no_content)
  end
end
