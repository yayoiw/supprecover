# さぷリカバー

## 画面遷移図
Figma: https://www.figma.com/file/067vzyD29cW4faCASK19Vz/supprecover?node-id=0%3A1&t=WOujkJdSFB8eMbiM-1

## ER図
https://gyazo.com/f4e290fee1ff03d6a69bafeddfb32ce9

■ サービス概要

  健康診断引っかかった人が診断結果を登録することで
  次回の健康診断までの間に数値改善できるよう
  おすすめサプリを提案するサービス



　■メインのターゲットユーザー

　健康診断結果がB以下でてっとり早く改善したいと思っている方



　■ユーザーが抱える課題

　診断結果が思わしくないが、食事や運動など根本から生活改善をするのは厳しい
  診断結果で複数項目引っかかっている場合、その数だけどんなサプリで改善が期待できるのかを検索する必要がある



　■解決方法

　健康診断結果を入力するだけでおすすめサプリが一覧で提案される
  何を買えばよいかがひとめでわかる



　■実装予定の機能

・利用開始前に免責事項等の注意書きのでるモーダルウィンドウがでる
  →モーダル内に同意を求めるチェックボックスを含め、チェックをつけた上で同意ボタンをおさないと利用ができない
・検診結果入力前に完全版か簡易版(下記記載)、どちらにするか選べる
・ユーザーが検診結果を入力できる(検診結果全部の結果を入力する完全版)
・ユーザーが検診結果を入力できる(検診結果一部の結果を入力する簡易版)
・ユーザーが希望すれば追加アンケートに回答できる
・ユーザーが回答している際にあとどれくらいで入力が終わるのか、目安がわかるようプログレスバーがでる
・検診結果入力ページは1ページあたり5~10項目程度にして複数ページで入力を求める
・健診項目入力フォームは数字を入れることができる、もしくはラジオボタンで結果を選択できる(結果なしも含め)
・入力中のページに進むボタンがあり、空欄があると警告がでて次へ進めない
・入力中のページに戻るボタンがあり、前のページ入力項目を修正できる
・入力終了後に希望者のみのアンケートに回答するか選べる
・全ての項目の入力が終わったら結果を参照できる(おすすめサプリが出てくる)
・結果をTwitterでシェアできる



　■なぜこのサービスを作りたいのか？
    私自身健康診断で少しづつ引っかかった際に、どんなサプリだと改善が見込めるのか
    引っかかった項目や上限値ギリギリの項目を一つ一つ調べて検索をしていたが非常に手間であった
    健康診断の結果を入力したらそのままおすすめの改善サプリが出てきたら楽なのに…と考えたことがあったのでPFにしてみようと思った



　■スケジュール
　企画〜技術調査：1/14 〆切
　README〜ER図作成：1/14 〆切
　メイン機能実装：1/8 - 3/18
　β版をRUNTEQ内リリース（MVP）：4/1 〆切
　本番リリース：4/15末