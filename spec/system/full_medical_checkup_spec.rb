require 'rails_helper'

RSpec.describe '完全版診断機能', type: :system do
  let(:user) { FactoryBot.create(:user) }
  shared_examples_for '簡易版診断完了まで' do
    before do
      visit root_path
      expect(current_path).to eq(before_use_path)
      page.execute_script('document.querySelectorAll(".fade").forEach(function(element) { element.classList.remove("fade"); })')
      expect(page).to have_selector('#staticBackdrop')
      check('beforeUseCheckBox')
      expect(page).to have_checked_field('beforeUseCheckBox')
      expect(page).to have_button('modalButton', disabled: false)
      click_button('modalButton')
      expect(page).to have_no_css('.modal fade show')
      fill_in 'user_name', with: user.name
      click_on('先へすすむ')
      visit new_user_easy_medical_checkups_path(user)
      expect(current_path).to eq(new_user_easy_medical_checkups_path(user))
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
      expect(current_path).to eq(user_easy_medical_checkups_path(user))
      visit root_path
    end
  end

  context '完全版診断' do
    include_examples '簡易版診断完了まで'
    before do
      visit new_user_full_medical_checkups_path(user)
      expect(current_path).to eq(new_user_full_medical_checkups_path(user))
    end

    it '空腹時血糖のみ未入力' do
      fill_in 'full_medical_checkup_fasting_blood_sugar', with: ''
      fill_in 'full_medical_checkup_hba1c', with: 5.0
      select '-', from: 'full_medical_checkup_urine_sugar'
      fill_in 'full_medical_checkup_uric_acid', with: 4.5
      fill_in 'full_medical_checkup_creatinine', with: 0.6
      fill_in 'full_medical_checkup_egfr', with: 75
      fill_in 'full_medical_checkup_hematocrit', with: 40
      fill_in 'full_medical_checkup_hemoglobin', with: 14
      fill_in 'full_medical_checkup_rbc', with: 425
      fill_in 'full_medical_checkup_wbc', with: 5700
      select '-', from: 'full_medical_checkup_urine_protein'
      click_button '送信'
      expect(current_path).to eq(user_full_medical_checkups_path(user))
      expect(page).to have_text('空腹時血糖を入力してください')
      # 期待する動作 弾かれる
    end

    it 'HbA1cのみ未入力' do
      fill_in 'full_medical_checkup_fasting_blood_sugar', with: 85
      fill_in 'full_medical_checkup_hba1c', with: ''
      select '-', from: 'full_medical_checkup_urine_sugar'
      fill_in 'full_medical_checkup_uric_acid', with: 4.5
      fill_in 'full_medical_checkup_creatinine', with: 0.6
      fill_in 'full_medical_checkup_egfr', with: 75
      fill_in 'full_medical_checkup_hematocrit', with: 40
      fill_in 'full_medical_checkup_hemoglobin', with: 14
      fill_in 'full_medical_checkup_rbc', with: 425
      fill_in 'full_medical_checkup_wbc', with: 5700
      select '-', from: 'full_medical_checkup_urine_protein'
      click_button '送信'
      expect(current_path).to eq(user_full_medical_checkups_path(user))
      expect(page).to have_text('HbA1cを入力してください')
      # 期待する動作 弾かれる
    end

    it '尿酸のみ未入力' do
      fill_in 'full_medical_checkup_fasting_blood_sugar', with: 85
      fill_in 'full_medical_checkup_hba1c', with: 5.0
      select '-', from: 'full_medical_checkup_urine_sugar'
      fill_in 'full_medical_checkup_uric_acid', with: '尿酸値を入力してください'
      fill_in 'full_medical_checkup_creatinine', with: 0.6
      fill_in 'full_medical_checkup_egfr', with: 75
      fill_in 'full_medical_checkup_hematocrit', with: 40
      fill_in 'full_medical_checkup_hemoglobin', with: 14
      fill_in 'full_medical_checkup_rbc', with: 425
      fill_in 'full_medical_checkup_wbc', with: 5700
      select '-', from: 'full_medical_checkup_urine_protein'
      click_button '送信'
      expect(current_path).to eq(user_full_medical_checkups_path(user))
      expect(page).to have_text('')
      # 期待する動作 弾かれる
    end

    it 'クレアチニンのみ未入力' do
      fill_in 'full_medical_checkup_fasting_blood_sugar', with: 85
      fill_in 'full_medical_checkup_hba1c', with: 5.0
      select '-', from: 'full_medical_checkup_urine_sugar'
      fill_in 'full_medical_checkup_uric_acid', with: 4.5
      fill_in 'full_medical_checkup_creatinine', with: 'クレアチニンを入力してください'
      fill_in 'full_medical_checkup_egfr', with: 75
      fill_in 'full_medical_checkup_hematocrit', with: 40
      fill_in 'full_medical_checkup_hemoglobin', with: 14
      fill_in 'full_medical_checkup_rbc', with: 425
      fill_in 'full_medical_checkup_wbc', with: 5700
      select '-', from: 'full_medical_checkup_urine_protein'
      click_button '送信'
      expect(current_path).to eq(user_full_medical_checkups_path(user))
      expect(page).to have_text('')
      # 期待する動作 弾かれる
    end

    it 'eGFRのみ未入力' do
      fill_in 'full_medical_checkup_fasting_blood_sugar', with: 85
      fill_in 'full_medical_checkup_hba1c', with: 5.0
      select '-', from: 'full_medical_checkup_urine_sugar'
      fill_in 'full_medical_checkup_uric_acid', with: 4.5
      fill_in 'full_medical_checkup_creatinine', with: 0.6
      fill_in 'full_medical_checkup_egfr', with: 'eGFRを入力してください'
      fill_in 'full_medical_checkup_hematocrit', with: 40
      fill_in 'full_medical_checkup_hemoglobin', with: 14
      fill_in 'full_medical_checkup_rbc', with: 425
      fill_in 'full_medical_checkup_wbc', with: 5700
      select '-', from: 'full_medical_checkup_urine_protein'
      click_button '送信'
      expect(current_path).to eq(user_full_medical_checkups_path(user))
      expect(page).to have_text('')
      # 期待する動作 弾かれる
    end

    it 'ヘマトクリットのみ未入力' do
      fill_in 'full_medical_checkup_fasting_blood_sugar', with: 85
      fill_in 'full_medical_checkup_hba1c', with: 5.0
      select '-', from: 'full_medical_checkup_urine_sugar'
      fill_in 'full_medical_checkup_uric_acid', with: 4.5
      fill_in 'full_medical_checkup_creatinine', with: 0.6
      fill_in 'full_medical_checkup_egfr', with: 75
      fill_in 'full_medical_checkup_hematocrit', with: 'ヘマトクリットを入力してください'
      fill_in 'full_medical_checkup_hemoglobin', with: 14
      fill_in 'full_medical_checkup_rbc', with: 425
      fill_in 'full_medical_checkup_wbc', with: 5700
      select '-', from: 'full_medical_checkup_urine_protein'
      click_button '送信'
      expect(current_path).to eq(user_full_medical_checkups_path(user))
      expect(page).to have_text('')
      # 期待する動作 弾かれる
    end

    it 'ヘモグロビンのみ未入力' do
      fill_in 'full_medical_checkup_fasting_blood_sugar', with: 85
      fill_in 'full_medical_checkup_hba1c', with: 5.0
      select '-', from: 'full_medical_checkup_urine_sugar'
      fill_in 'full_medical_checkup_uric_acid', with: 4.5
      fill_in 'full_medical_checkup_creatinine', with: 0.6
      fill_in 'full_medical_checkup_egfr', with: 75
      fill_in 'full_medical_checkup_hematocrit', with: 40
      fill_in 'full_medical_checkup_hemoglobin', with: 'ヘモグロビンを入力してください'
      fill_in 'full_medical_checkup_rbc', with: 425
      fill_in 'full_medical_checkup_wbc', with: 5700
      select '-', from: 'full_medical_checkup_urine_protein'
      click_button '送信'
      expect(current_path).to eq(user_full_medical_checkups_path(user))
      expect(page).to have_text('')
      # 期待する動作 弾かれる
    end

    it 'RBCのみ未入力' do
      fill_in 'full_medical_checkup_fasting_blood_sugar', with: 85
      fill_in 'full_medical_checkup_hba1c', with: 5.0
      select '-', from: 'full_medical_checkup_urine_sugar'
      fill_in 'full_medical_checkup_uric_acid', with: 4.5
      fill_in 'full_medical_checkup_creatinine', with: 0.6
      fill_in 'full_medical_checkup_egfr', with: 75
      fill_in 'full_medical_checkup_hematocrit', with: 40
      fill_in 'full_medical_checkup_hemoglobin', with: 14
      fill_in 'full_medical_checkup_rbc', with: '赤血球を入力してください'
      fill_in 'full_medical_checkup_wbc', with: 5700
      select '-', from: 'full_medical_checkup_urine_protein'
      click_button '送信'
      expect(current_path).to eq(user_full_medical_checkups_path(user))
      expect(page).to have_text('')
      # 期待する動作 弾かれる
    end

    it 'WBCのみ未入力' do
      fill_in 'full_medical_checkup_fasting_blood_sugar', with: 85
      fill_in 'full_medical_checkup_hba1c', with: 5.0
      select '-', from: 'full_medical_checkup_urine_sugar'
      fill_in 'full_medical_checkup_uric_acid', with: 4.5
      fill_in 'full_medical_checkup_creatinine', with: 0.6
      fill_in 'full_medical_checkup_egfr', with: 75
      fill_in 'full_medical_checkup_hematocrit', with: 40
      fill_in 'full_medical_checkup_hemoglobin', with: 14
      fill_in 'full_medical_checkup_rbc', with: 425
      fill_in 'full_medical_checkup_wbc', with: ''
      select '-', from: 'full_medical_checkup_urine_protein'
      click_button '送信'
      expect(current_path).to eq(user_full_medical_checkups_path(user))
      expect(page).to have_text('白血球を入力してください')
      # 期待する動作 弾かれる
    end

    it '全てに有効な値を入力' do
      fill_in 'full_medical_checkup_fasting_blood_sugar', with: 85
      fill_in 'full_medical_checkup_hba1c', with: 5.0
      select '-', from: 'full_medical_checkup_urine_sugar'
      fill_in 'full_medical_checkup_uric_acid', with: 4.5
      fill_in 'full_medical_checkup_creatinine', with: 0.6
      fill_in 'full_medical_checkup_egfr', with: 75
      fill_in 'full_medical_checkup_hematocrit', with: 40
      fill_in 'full_medical_checkup_hemoglobin', with: 14
      fill_in 'full_medical_checkup_rbc', with: 425
      fill_in 'full_medical_checkup_wbc', with: 5700
      select '-', from: 'full_medical_checkup_urine_protein'
      click_button '送信'
      expect(current_path).to eq(user_full_medical_checkups_path(user))
      expect(page).to have_text('なお、サプリメントは栄養補助食品です。')
      # 期待する動作 結果画面に遷移
    end
  end

  context '完全版診断後' do
    include_examples '簡易版診断完了まで'
    before do
      visit new_user_full_medical_checkups_path(user)
      expect(current_path).to eq(new_user_full_medical_checkups_path(user))
      fill_in 'full_medical_checkup_fasting_blood_sugar', with: 85
      fill_in 'full_medical_checkup_hba1c', with: 5.0
      select '-', from: 'full_medical_checkup_urine_sugar'
      fill_in 'full_medical_checkup_uric_acid', with: 4.5
      fill_in 'full_medical_checkup_creatinine', with: 0.6
      fill_in 'full_medical_checkup_egfr', with: 75
      fill_in 'full_medical_checkup_hematocrit', with: 40
      fill_in 'full_medical_checkup_hemoglobin', with: 14
      fill_in 'full_medical_checkup_rbc', with: 425
      fill_in 'full_medical_checkup_wbc', with: 5700
      select '-', from: 'full_medical_checkup_urine_protein'
      click_button '送信'
      expect(current_path).to eq(user_full_medical_checkups_path(user))
      expect(page).to have_text('なお、サプリメントは栄養補助食品です。')
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
