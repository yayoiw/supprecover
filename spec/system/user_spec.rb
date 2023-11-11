require 'rails_helper'

RSpec.describe 'ユーザー登録機能', type: :system do
  describe '登録' do
    context '利用規約モーダルの枠外をクリックして閉じようとする' do
      it '' do
        #期待する動作　閉じることができない
      end
    end

    context '利用規約モーダルに未チェックのまま利用を始めるを押下' do
      it '' do
        #期待する動作　押下不可
      end
    end

    context '利用規約モーダル利用をやめるを押下' do
      it '' do
        #期待する動作　yahoo.co.jpへ飛ばされる
      end
    end

    context '利用規約モーダル、チェックボックスにチェックをいれて利用を始めるを押下' do
      it '' do
        #期待する動作　強制モーダルが閉じてユーザー名登録画面が出てくる
      end
    end

    context 'ユーザー名登録前にroot_pathへアクセス' do
      it '' do
        #期待する動作　名前を登録してくださいとでてbefore_use画面に遷移
      end
    end

    context 'ユーザー名登録前にabout_pathへアクセス' do
      it '' do
        #期待する動作　aboutへ遷移
      end
    end

    context 'ユーザー名登録前にプライバシーポリシーへアクセス' do
      it '' do
        #期待する動作　プライバシーポリシーへ遷移
      end
    end

    context 'ユーザー名登録前に利用規約へアクセス' do
      it '' do
        #期待する動作　利用規約へ遷移
      end
    end

    context 'ユーザー名登録前にコンタクトへアクセス' do
      it '' do
        #期待する動作　コンタクト（twitter）新規タブで遷移
      end
    end


    context 'ユーザー名ブランクで登録した場合' do
      before do
        #事前準備
      end
    end
    it '' do
      #期待する動作　名前を入力してくださいとでる、強制モーダルがでる
    end

    context 'ユーザー名ありで登録した場合'do
    before do
      # 事前準備　
    end

    it '◯◯する' do
      #期待する動作　登録できる
    end

    context '同じユーザー名で登録した場合' do
      it '' do
        #期待する動作　登録拒否される
      end
    end

    context '登録後にbefore_useにアクセスした場合' do
      it '' do
        #期待する動作　root_pathへ飛ばされる
      end
    end

    context 'ユーザー名登録後にroot_pathへアクセス' do
      it '' do
        #期待する動作　名前を登録してくださいとでてbefore_use画面に遷移
      end
    end

    context 'ユーザー名登録後にabout_pathへアクセス' do
      it '' do
        #期待する動作　aboutへ遷移
      end
    end

    context 'ユーザー名登録後にプライバシーポリシーへアクセス' do
      it '' do
        #期待する動作　プライバシーポリシーへ遷移
      end
    end

    context 'ユーザー名登録後に利用規約へアクセス' do
      it '' do
        #期待する動作　利用規約へ遷移
      end
    end

    context 'ユーザー名登録後にコンタクトへアクセス' do
      it '' do
        #期待する動作　コンタクト（twitter）新規タブで遷移
      end
    end

  end

end