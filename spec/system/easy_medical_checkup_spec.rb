require 'rails_helper'

RSpec.describe '簡易版診断機能', type: :system do
  let(:user) { FactoryBot.create(:user)}
  shared_examples_for 'ユーザー名登録まで' do
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
      fill_in 'user_name', with: 'testA'
      click_on('先へすすむ')
    end
  end
  context 'ユーザー名登録後、診断前まで' do
    include_examples 'ユーザー名登録まで'

    it '完全版診断が使えない' do
      expect(page).to have_css('#before_full_checkup.disabled')
      #期待する動作 完全版診断がグレーアウトしている
    end

    it '簡易版診断にアクセスできる' do
      visit new_user_easy_medical_checkups_path(user)
      expect(current_path).to eq(new_user_easy_medical_checkups_path(user))
      #期待する動作 簡易版診断にアクセスできる
    end
  end

  context '診断' do
    include_examples 'ユーザー名登録まで'
    before do
      visit new_user_easy_medical_checkups_path(user)
      expect(current_path).to eq(new_user_easy_medical_checkups_path(user))
    end

    it '身長のみ未入力' do
      select '選択して下さい', from: :height
      fill_in :weight, with: 60
      fill_in :blood_pressure_up, with: 120
      fill_in :blood_pressure_down, with: 80
      fill_in :total_cholesterol, with: 180
      fill_in :hdl_cholesterol, with: 55
      fill_in :ldl_cholesterol, with: 90
      fill_in :neutral_fat, with: 100
      fill_in :ast, with: 20
      fill_in :alt, with: 20
      fill_in :gamma_gtp, with: 50
      click_button '送信'
      expect(current_path).to eq(new_user_easy_medical_checkups_path(user))
      expect(page).to have_text('身長を入力してください')
      #期待する動作 弾かれる
    end

    it '体重のみ未入力' do
      fill_in :height, with: 170
      select '選択して下さい', from: :height
      fill_in :blood_pressure_up, with: 120
      fill_in :blood_pressure_down, with: 80
      fill_in :total_cholesterol, with: 180
      fill_in :hdl_cholesterol, with: 55
      fill_in :ldl_cholesterol, with: 90
      fill_in :neutral_fat, with: 100
      fill_in :ast, with: 20
      fill_in :alt, with: 20
      fill_in :gamma_gtp, with: 50
      click_button '送信'
      expect(current_path).to eq(new_user_easy_medical_checkups_path(user))
      expect(page).to have_text('体重を入力してください')
      #期待する動作 弾かれる
    end

    it '血圧（上）のみ未入力' do
      fill_in :height, with: 170
      fill_in :weight, with: 60
      fill_in :blood_pressure_up, with: ''
      fill_in :blood_pressure_down, with: 80
      fill_in :total_cholesterol, with: 180
      fill_in :hdl_cholesterol, with: 55
      fill_in :ldl_cholesterol, with: 90
      fill_in :neutral_fat, with: 100
      fill_in :ast, with: 20
      fill_in :alt, with: 20
      fill_in :gamma_gtp, with: 50
      click_button '送信'
      expect(current_path).to eq(new_user_easy_medical_checkups_path(user))
      expect(page).to have_text('血圧(上)を入力してください')
      #期待する動作 弾かれる
    end

    it '血圧（下）のみ未入力' do
      fill_in :height, with: 170
      fill_in :weight, with: 60
      fill_in :blood_pressure_up, with: 120
      fill_in :blood_pressure_down, with: ''
      fill_in :total_cholesterol, with: 180
      fill_in :hdl_cholesterol, with: 55
      fill_in :ldl_cholesterol, with: 90
      fill_in :neutral_fat, with: 100
      fill_in :ast, with: 20
      fill_in :alt, with: 20
      fill_in :gamma_gtp, with: 50
      click_button '送信'
      expect(current_path).to eq(new_user_easy_medical_checkups_path(user))
      expect(page).to have_text('血圧(下)を入力してください')
      #期待する動作 弾かれる
    end

    it '総コレステロールのみ未入力' do
      fill_in :height, with: 170
      fill_in :weight, with: 60
      fill_in :blood_pressure_up, with: 120
      fill_in :blood_pressure_down, with: 80
      fill_in :total_cholesterol, with: ''
      fill_in :hdl_cholesterol, with: 55
      fill_in :ldl_cholesterol, with: 90
      fill_in :neutral_fat, with: 100
      fill_in :ast, with: 20
      fill_in :alt, with: 20
      fill_in :gamma_gtp, with: 50
      click_button '送信'
      expect(current_path).to eq(new_user_easy_medical_checkups_path(user))
      expect(page).to have_text('総コレステロールを入力してください')
      #期待する動作 弾かれる
    end

    it 'HDLコレステロールのみ未入力' do
      fill_in :height, with: 170
      fill_in :weight, with: 60
      fill_in :blood_pressure_up, with: 120
      fill_in :blood_pressure_down, with: 80
      fill_in :total_cholesterol, with: 180
      fill_in :hdl_cholesterol, with: ''
      fill_in :ldl_cholesterol, with: 90
      fill_in :neutral_fat, with: 100
      fill_in :ast, with: 20
      fill_in :alt, with: 20
      fill_in :gamma_gtp, with: 50
      click_button '送信'
      expect(current_path).to eq(new_user_easy_medical_checkups_path(user))
      expect(page).to have_text('HDLコレステロールを入力してください')
      #期待する動作 弾かれる
    end

    it 'LDLコレステロールのみ未入力' do
      fill_in :height, with: 170
      fill_in :weight, with: 60
      fill_in :blood_pressure_up, with: 120
      fill_in :blood_pressure_down, with: 80
      fill_in :total_cholesterol, with: 180
      fill_in :hdl_cholesterol, with: 55
      fill_in :ldl_cholesterol, with: ''
      fill_in :neutral_fat, with: 100
      fill_in :ast, with: 20
      fill_in :alt, with: 20
      fill_in :gamma_gtp, with: 50
      click_button '送信'
      expect(current_path).to eq(new_user_easy_medical_checkups_path(user))
      expect(page).to have_text('LDLコレステロールを入力してください')
      #期待する動作 弾かれる
    end

    it '中性脂肪のみ未入力' do
      fill_in :height, with: 170
      fill_in :weight, with: 60
      fill_in :blood_pressure_up, with: 120
      fill_in :blood_pressure_down, with: 80
      fill_in :total_cholesterol, with: 180
      fill_in :hdl_cholesterol, with: 55
      fill_in :ldl_cholesterol, with: 90
      fill_in :neutral_fat, with: ''
      fill_in :ast, with: 20
      fill_in :alt, with: 20
      fill_in :gamma_gtp, with: 50
      click_button '送信'
      expect(current_path).to eq(new_user_easy_medical_checkups_path(user))
      expect(page).to have_text('中性脂肪を入力してください')
      #期待する動作 弾かれる
    end

    it 'ASTのみ未入力' do
      fill_in :height, with: 170
      fill_in :weight, with: 60
      fill_in :blood_pressure_up, with: 120
      fill_in :blood_pressure_down, with: 80
      fill_in :total_cholesterol, with: 180
      fill_in :hdl_cholesterol, with: 55
      fill_in :ldl_cholesterol, with: 90
      fill_in :neutral_fat, with: 100
      fill_in :ast, with: ''
      fill_in :alt, with: 20
      fill_in :gamma_gtp, with: 50
      click_button '送信'
      expect(current_path).to eq(new_user_easy_medical_checkups_path(user))
      expect(page).to have_text('ASTを入力してください')
      #期待する動作 弾かれる
    end

    it 'ALTのみ未入力' do
      fill_in :height, with: 170
      fill_in :weight, with: 60
      fill_in :blood_pressure_up, with: 120
      fill_in :blood_pressure_down, with: 80
      fill_in :total_cholesterol, with: 180
      fill_in :hdl_cholesterol, with: 55
      fill_in :ldl_cholesterol, with: 90
      fill_in :neutral_fat, with: 100
      fill_in :ast, with: 20
      fill_in :alt, with: ''
      fill_in :gamma_gtp, with: 50
      click_button '送信'
      expect(current_path).to eq(new_user_easy_medical_checkups_path(user))
      expect(page).to have_text('ALTを入力してください')
      #期待する動作 弾かれる
    end

    it 'γ-GTPのみ未入力' do
      fill_in :height, with: 170
      fill_in :weight, with: 60
      fill_in :blood_pressure_up, with: 120
      fill_in :blood_pressure_down, with: 80
      fill_in :total_cholesterol, with: 180
      fill_in :hdl_cholesterol, with: 55
      fill_in :ldl_cholesterol, with: 90
      fill_in :neutral_fat, with: 100
      fill_in :ast, with: 20
      fill_in :alt, with: 20
      fill_in :gamma_gtp, with: ''
      click_button '送信'
      expect(current_path).to eq(new_user_easy_medical_checkups_path(user))
      expect(page).to have_text('γ-GTPを入力してください')
      #期待する動作 弾かれる
    end

    it '指定範囲外の身長を入力' do
      fill_in :height, with: 201
      fill_in :weight, with: 60
      fill_in :blood_pressure_up, with: 120
      fill_in :blood_pressure_down, with: 80
      fill_in :total_cholesterol, with: 180
      fill_in :hdl_cholesterol, with: 55
      fill_in :ldl_cholesterol, with: 90
      fill_in :neutral_fat, with: 100
      fill_in :ast, with: 20
      fill_in :alt, with: 20
      fill_in :gamma_gtp, with: 50
      click_button '送信'
      expect(page).to have_text('身長を入力してください')
      #期待する動作 弾かれる
    end

    it '指定範囲外の体重を入力' do
      fill_in :height, with: 170
      fill_in :weight, with: 151
      fill_in :blood_pressure_up, with: 120
      fill_in :blood_pressure_down, with: 80
      fill_in :total_cholesterol, with: 180
      fill_in :hdl_cholesterol, with: 55
      fill_in :ldl_cholesterol, with: 90
      fill_in :neutral_fat, with: 100
      fill_in :ast, with: 20
      fill_in :alt, with: 20
      fill_in :gamma_gtp, with: 50
      click_button '送信'
      expect(page).to have_text('体重を入力してください')
      #期待する動作 弾かれる
    end

    it '全てに有効な値を入力' do
      fill_in :height, with: 170
      fill_in :weight, with: 60
      fill_in :blood_pressure_up, with: 120
      fill_in :blood_pressure_down, with: 80
      fill_in :total_cholesterol, with: 180
      fill_in :hdl_cholesterol, with: 55
      fill_in :ldl_cholesterol, with: 90
      fill_in :neutral_fat, with: 100
      fill_in :ast, with: 20
      fill_in :alt, with: 20
      fill_in :gamma_gtp, with: 50
      click_button '送信'
      expect(page).to eq(user_easy_medical_checkups(user))
      #期待する動作 結果画面に遷移
    end

  end

  context '診断結果表示後' do
    before '全てに有効な値を入力' do
      fill_in :height, with: 170
      fill_in :weight, with: 60
      fill_in :blood_pressure_up, with: 120
      fill_in :blood_pressure_down, with: 80
      fill_in :total_cholesterol, with: 180
      fill_in :hdl_cholesterol, with: 55
      fill_in :ldl_cholesterol, with: 90
      fill_in :neutral_fat, with: 100
      fill_in :ast, with: 20
      fill_in :alt, with: 20
      fill_in :gamma_gtp, with: 50
      click_button '送信'
      expect(page).to eq(user_easy_medical_checkups(user))
    end

    it 'before_useにアクセスした場合' do
      visit before_use_path
      expect(current_path).to eq(root_path)
      expect(page).to have_text('既に登録済みの名前です')
      #期待する動作 root_pathへ飛ばされる
    end

    it 'about_pathへアクセスできる' do
      visit about_path
      expect(current_path).to eq(about_path)
      #期待する動作 aboutへ遷移
    end

    it 'privacy_policy_pathへアクセス' do
      visit privacy_policy_path
      expect(current_path).to eq(privacy_policy_path)
      #期待する動作 プライバシーポリシーへ遷移
    end

    it 'terms_of_use_pathへアクセス' do
      visit terms_of_use_path
      expect(current_path).to eq(terms_of_use_path)
      #期待する動作 利用規約へ遷移
    end

    it 'コンタクトへのリンクがある' do
      expect(page).to have_link(href: 'https://twitter.com/841wtb',target: '_blank')
      #期待する動作 コンタクト（twitter）新規タブで遷移
    end

    it 'すべて閾値内(異常値なし)で入力された場合' do
      expect(page).to have_text('あなたは現在健康であるため、健康診断数値改善のためのサプリは不要になります。')
    end
  end

end