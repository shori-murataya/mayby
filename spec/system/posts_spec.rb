require 'rails_helper'

describe 'POST投稿', type: :system do
  let(:user) { create(:user) }
  context 'ログイン状態の時' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: user.password
      click_button 'ログイン'
    end
    it '投稿' do
      click_link 'Mayby投稿'
      fill_in '名前', with: '飲み会'
      fill_in '遊び方', with: '飲み会'
      choose '一人'
      choose 'わいわい'
      expect { click_button 'Mayby作成' }.to change { Post.count }.from(0).to(1)
    end
  end
end
