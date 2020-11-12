# README
## usersテーブル
| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| nickname          | string     | null: false |
| email             | string     | null: false |
| password          | string     | null: false |
| family_name       | string     | null: false |
| first_name        | string     | null: false |
| birth_date        | date       | null: false |

### Association
- has_many :products
- has_many :comments
- has_many :orders



## productsテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| quantity         | integer    | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipment_term_id | integer    | null: false                    |
| shipment_fee_id  | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- has_one_attached :image
- belongs_to :user
- has_many   :comments
- has_one    :order



## commentsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product



## addressテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to :order



## ordersテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has one    :address



【アプリケーション名】
Food Ecology

【なぜこのアプリを作ったか】
■ 前職は飲食業界にいて、毎日売れ残った商品を捨てていた
  前職の飲食店では、毎日閉店後にまだ食べられる食品であってもたくさん廃棄していて、もったいないと感じていた。
  かといって「どうせ捨てるものだから」と持って帰ると、解雇や窃盗罪に問われたりするため、捨てるしかなく、もどかしく感じていた。
■ 惣菜だけでなく、加工食品もたくさん捨てられている
  当時扱っていた食品はその場で調理するお惣菜であったため、消費期限が短く、当日中に廃棄せざるを得ない事情は理解できたが、陳列してあり保存料なども使っていて、
  更に賞味期限前の加工食品であっても、規則の期限をすぎると陳列できなくなり、それらは全て廃棄処分される。

【ペルソナ、ターゲット】
■ 個人法人関係なく出品・購入可能で、ターゲットは買い手と売り手に分けて考える。
　売り手：食品卸売業者、スーパー、コンビニ、農家
　買い手：一般消費者、個人経営飲食店、食品加工業者

【このアプリで実現できること】
● まだ食べられるのに捨てられていた食品を流通させることで、食品ロスを減らすことが出来ます。
● 食品卸売業者やスーパーなどの販売業者は、賞味期限切れで売れなくなった商品を売ることが出来、廃棄にかかるコストをなくすことが出来ます。
● 個人経営のレストランや加工工場などは安く仕入れることができ、入荷のコストを抑えることが出来ます。
● 消費者は通常より安い価格で購入することが出来ます。
● 農家など生産者は、本来なら流通の前段階で廃棄していた作物を出荷でき、売り上げになります。

【実装を完了した機能の一覧】
１）ユーザー登録およびログイン機能(devise)
  ユーザー登録しなくても商品一覧や詳細、食品ロスについてなどは閲覧可能
２）ログイン機能(devise)
  メールアドレス、パスワードの入力でログインでき、ログインユーザーは、商品の購入・出品・コメントが可能
３）商品一覧表示、詳細表示、編集機能
  商品の一覧表示、個別の詳細情報、出品商品の編集機能
４）商品出品機能
  出品したい商品をすぐ出品できるように実装
５）商品購入機能
  PAY.JPを利用した商品購入機能の実装方法を習得
６）出品時の画像プレビュー機能
  出品前に投稿画像を確認できる
７）コメント投稿削除機能
  ユーザーはコメントの登録、削除のみ可能
８）食品ロス問題提起
  食品ロス問題についての概要、原因、対策を記載
９）スマホレスポンシブ機能
  非Bootstrap
10）テストの実施（model)
  RSpec、factory_bot使用
11）AWSS3に投稿画像を保存
  Heroku上で扱う画像ファイルなどは、仕様で24時間でリセットされるめ、AWSS3上に保存
12）全て著作権フリーの画像を使用
  権利関係で何も問題ないようにするため

【開発日数】
作業期間　2020年9月7日　〜 202年11月8日 のべ工数　63日/630時間

【この先実装したい機能】
・出品者の評価機能、顔写真掲載
・SNS連携（新規登録、ログイン時）
・ジャンル分け一覧表示
・条件検索機能
・問い合わせフォーム
・コメント投稿者のコメント削除機能
・AWSEC2,unicorn,nginxによる自動デプロイ機能
・画像複数投稿機能

【連絡先】
久田智大 ヒサダトモヒロ   Gmail / dekirumadeyamenai@gmail.com    twitter / https://twitter.com/tomotech5

トップページ　https://gyazo.com/d36f849feced8eae164c1abaa6b96372
食品ロス説明ページ　https://gyazo.com/c335641bdca176c720f6abec446e997d
