require 'rails_helper'

RSpec.describe '簡易版診断機能', type: :system do
  let(:user) { FactoryBot.build(:user) }
  shared_examples_for 'ユーザー名登録まで' do
    before do
      visit root_path
      expect(current_path).to eq(before_use_path)
      page.execute_script('document.querySelectorAll(".fade").forEach(function(element) { element.classList.remove("fade"); })')
      check('beforeUseCheckBox')
      click_button('modalButton')
      fill_in 'user_name', with: user.name
      click_on('先へすすむ')
    end
  end
  context 'ユーザー名登録後、診断まで' do
    include_examples 'ユーザー名登録まで'
    it '完全版診断が使えない' do
      expect(page).to have_css('#before_full_checkup.disabled')
      # 期待する動作 完全版診断がグレーアウトしている
    end

    it '簡易版診断にアクセスできる' do
      user= User.first
      visit new_user_easy_medical_checkups_path(user.id)
      expect(page).to have_text('身長')
      # 期待する動作 簡易版診断にアクセスできる
    end

    it '全項目未入力' do
      user = User.first
      visit new_user_easy_medical_checkups_path(user.id)
      select '選択して下さい', from: 'easy_medical_checkup_height'
      select '選択して下さい', from: 'easy_medical_checkup_weight'
      fill_in 'easy_medical_checkup_blood_pressure_up', with: ''
      fill_in 'easy_medical_checkup_blood_pressure_down', with: ''
      fill_in 'easy_medical_checkup_total_cholesterol', with: ''
      fill_in 'easy_medical_checkup_hdl_cholesterol', with: ''
      fill_in 'easy_medical_checkup_ldl_cholesterol', with: ''
      fill_in 'easy_medical_checkup_neutral_fat', with: ''
      fill_in 'easy_medical_checkup_ast', with: ''
      fill_in 'easy_medical_checkup_alt', with: ''
      fill_in 'easy_medical_checkup_gamma_gtp', with: ''
      click_button '送信'
      user = User.first
      expect(current_path).to eq(user_easy_medical_checkups_path(user.id))
      expect(page).to have_text('身長を入力してください')
      expect(page).to have_text('体重を入力してください')
      expect(page).to have_text('血圧(上)を入力してください')
      expect(page).to have_text('血圧(下)を入力してください')
      expect(page).to have_text('総コレステロールを入力してください')
      expect(page).to have_text('HDLコレステロールを入力してください')
      expect(page).to have_text('LDLコレステロールを入力してください')
      expect(page).to have_text('中性脂肪を入力してください')
      expect(page).to have_text('ASTを入力してください')
      expect(page).to have_text('ALTを入力してください')
      expect(page).to have_text('γ-GTPを入力してください')
      # 期待する動作 弾かれる
    end

    it '全てに有効な値を入力' do
      user = User.first
      visit new_user_easy_medical_checkups_path(user.id)
      select 170, from: 'easy_medical_checkup_height'
      select 60, from: 'easy_medical_checkup_weight'
      fill_in 'easy_medical_checkup_blood_pressure_up', with: 120
      fill_in 'easy_medical_checkup_blood_pressure_down', with: 80
      fill_in 'easy_medical_checkup_total_cholesterol', with: 180
      fill_in 'easy_medical_checkup_hdl_cholesterol', with: 55
      fill_in 'easy_medical_checkup_ldl_cholesterol', with: 90
      fill_in 'easy_medical_checkup_neutral_fat', with: 100
      fill_in 'easy_medical_checkup_ast', with: 20
      fill_in 'easy_medical_checkup_alt', with: 20
      fill_in 'easy_medical_checkup_gamma_gtp', with: 50
      click_button '送信'
      expect(page).to have_text('あなたは現在健康であるため、健康診断数値改善のためのサプリは不要になります。')
      # 期待する動作 結果画面に遷移
    end
  end

  context '診断結果表示後' do
    include_examples 'ユーザー名登録まで'
    before '全てに有効な値を入力' do
      user = User.first
      visit new_user_easy_medical_checkups_path(user.id)
      select 170, from: 'easy_medical_checkup_height'
      select 60, from: 'easy_medical_checkup_weight'
      fill_in 'easy_medical_checkup_blood_pressure_up', with: 120
      fill_in 'easy_medical_checkup_blood_pressure_down', with: 80
      fill_in 'easy_medical_checkup_total_cholesterol', with: 180
      fill_in 'easy_medical_checkup_hdl_cholesterol', with: 55
      fill_in 'easy_medical_checkup_ldl_cholesterol', with: 90
      fill_in 'easy_medical_checkup_neutral_fat', with: 100
      fill_in 'easy_medical_checkup_ast', with: 20
      fill_in 'easy_medical_checkup_alt', with: 20
      fill_in 'easy_medical_checkup_gamma_gtp', with: 50
      click_button '送信'
      expect(page).to have_text('あなたは現在健康であるため、健康診断数値改善のためのサプリは不要になります')
    end

    it 'before_useにアクセスできない' do
      visit before_use_path
      expect(current_path).to eq(root_path)
      expect(page).to have_text('既に登録済みの名前です')
      # 期待する動作 root_pathへ飛ばされる
    end

    it 'about_pathへアクセスできる' do
      visit about_path
      expect(current_path).to eq(about_path)
      # 期待する動作 aboutへ遷移
    end

    it 'privacy_policy_pathへアクセスできる' do
      visit privacy_policy_path
      expect(current_path).to eq(privacy_policy_path)
      # 期待する動作 プライバシーポリシーへ遷移
    end

    it 'terms_of_use_pathへアクセスできる' do
      visit terms_of_use_path
      expect(current_path).to eq(terms_of_use_path)
      # 期待する動作 利用規約へ遷移
    end

    it 'コンタクトへのリンクがある' do
      expect(page).to have_link(href: 'https://twitter.com/841wtb', target: '_blank')
      # 期待する動作 コンタクト（twitter）新規タブで遷移
    end
  end
end

