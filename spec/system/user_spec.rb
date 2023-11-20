require 'rails_helper'

RSpec.describe 'ユーザー登録機能', type: :system, js: true do
  shared_examples_for '強制モーダルが消えるまで' do
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
    end
  end

  context '初回アクセス時の強制利用規約モーダルウィンドウ' do
    before do
      visit root_path
      expect(current_path).to eq(before_use_path)
      page.execute_script('document.querySelectorAll(".fade").forEach(function(element) { element.classList.remove("fade"); })')
      expect(page).to have_selector('#staticBackdrop')
    end

    it 'モーダル枠外をクリックして閉じることができない' do
      execute_script("document.querySelector('.navbar-brand').click();")
      expect(page).to have_selector('#staticBackdrop')
      #期待する動作 閉じることができない
    end

    it 'モーダル未チェックのままだと利用開始ボタンがグレーアウトして押せない' do
      expect(page).to have_unchecked_field('beforeUseCheckBox')
      expect(page).to have_button('modalButton', disabled: true)
      #期待する動作 押下不可
    end

    it 'モーダル内利用をやめるボタンを押すとyahooへ飛ばされる' do
      expect(page).to have_link(href: 'https://www.yahoo.co.jp/')
      #期待する動作 yahoo.co.jpへ飛ばされる
    end

    it 'モーダル内チェックボックスにチェックをいれて利用を始めるを押下するとモーダルが消える' do
      check('beforeUseCheckBox')
      expect(page).to have_checked_field('beforeUseCheckBox')
      expect(page).to have_button('modalButton')
      click_button('modalButton')
      expect(page).to have_no_selector('.modal fade')
      #期待する動作 強制モーダルが閉じる
    end
  end

  context 'ユーザー名登録前' do
    include_examples '強制モーダルが消えるまで'
    it 'root_pathへアクセスできず、before_use_pathへ飛ばされる' do
      expect(page).to have_text('名前を登録してください')
      #期待する動作 名前を登録してくださいとでてbefore_use画面に遷移
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
  end

  context 'ユーザー名登録' do
    include_examples '強制モーダルが消えるまで'
    it 'ユーザー名ブランクで登録した場合' do
      expect(page).to have_button('先へすすむ')
      click_on('先へすすむ')
      expect(page).to have_text('名前を入力してください')
      #期待する動作 名前を入力してくださいとでる
    end

    it 'ユーザー名ありで登録した場合' do
      fill_in 'user_name', with: 'testA'
      click_on('先へすすむ')
      expect(current_path).to eq(root_path)
      #期待する動作 登録できる
    end

    it '同じユーザー名で登録した場合' do
      FactoryBot.create(:user)
      fill_in 'user_name', with: 'testA'
      click_on('先へすすむ')
      expect(page).to have_text('名前はすでに存在します')
      #期待する動作 登録拒否される
    end

    it '30文字以上のユーザー名で登録した場合' do
      fill_in 'user_name', with: 'testAtestAtestAtestAtestAtestAtestA'
      click_on('先へすすむ')
      expect(page).to have_text('名前は30文字以内で入力してください')
    end
  end

  context 'ユーザー名登録後' do
    include_examples '強制モーダルが消えるまで'
    before do
      fill_in 'user_name', with: 'testA'
      click_on('先へすすむ')
      expect(current_path).to eq(root_path)
    end

    it 'before_useにアクセスした場合' do
      visit before_use_path
      expect(current_path).to eq(root_path)
      expect(page).to have_text('既に登録済みの名前です')
      #期待する動作 root_pathへ飛ばされる
    end

    it 'about_pathへアクセス' do
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
  end
end