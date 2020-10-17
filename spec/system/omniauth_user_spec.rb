require 'rails_helper'

RSpec.describe "Users through OmniAuth", type: :system do

  describe "OmniAuthのログイン" do
    context "twitterでのログイン" do

      before do
        OmniAuth.config.mock_auth[:twitter] = nil
        Rails.application.env_config['omniauth.auth'] = set_omniauth
        visit new_user_session_path
      end
      
      it "ログインをするとユーザー数が増える", js: true do
        expect {
          click_link 'twitterで新規登録'
          expect(page).to have_content 'Twitter アカウントによる認証に成功しました'
        }.to change(User, :count).by(1)
      end
    end

    context "googleでのログイン" do

      before do
        OmniAuth.config.mock_auth[:google_oauth2] = nil
        Rails.application.env_config['omniauth.auth'] = set_omniauth :google_oauth2
        visit new_user_session_path
      end

      it "ログインをするとユーザー数が増える", js: true do
        expect {
          click_link 'Googleで新規登録'
          expect(page).to have_content 'Google_oauth2 アカウントによる認証に成功しました'
        }.to change(User, :count).by(1)
      end
    end
    context "facebookでのログイン" do

      before do
        OmniAuth.config.mock_auth[:facebook] = nil
        Rails.application.env_config['omniauth.auth'] = set_omniauth :facebook
        visit new_user_session_path
      end

      it "ログインをするとユーザー数が増える", js: true do
        expect {
          click_link 'Facebookで新規登録'
          expect(page).to have_content 'Facebook アカウントによる認証に成功しました'
        }.to change(User, :count).by(1)
      end
    end
  end
end