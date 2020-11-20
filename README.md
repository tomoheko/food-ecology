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


# Food Ecology

### 【アプリケーションの作成理由】
1. 前職は飲食業界にいて、毎日売れ残った商品を捨てていた<br>
  前職の飲食店では、毎日閉店後にまだ食べられる食品であってもたくさん廃棄していて、もったいないと感じていた。<br>
  かといって「どうせ捨てるものだから」と持って帰ると、解雇や窃盗罪に問われたりするため、捨てるしかなく、もどかしく感じていた。<br>
2. 惣菜だけでなく、加工食品もたくさん捨てられている<br>
  食品には「３分の１ルール」という賞味期限に関するルールがあり、これによると、賞味期限内であってもある期限を過ぎると陳列できないというルールになっており、それを過ぎた場合、基本的には廃棄になります。<br>

このような無駄な食品ロスが、先進国を中心に多く発生していて、日本では「国民一人当たり毎日ご飯一杯分の食品を捨てている」ことになります。<br>
この現状をなんとかできないかと考え、このアプリを作りました。<br>


### 【ペルソナ、ターゲット】
■ 個人法人関係なく出品・購入可能で、ターゲットは出品者と購入者に分けて考える。<br>
  - 出品者：食品卸売業者、スーパー、コンビニ、農家<br>
  - 購入者：一般消費者、個人経営飲食店、食品加工業者<br>


### 【このアプリで実現できること】
  - まだ食べられるのに捨てられていた食品を流通させることで、食品ロスを減らすことが出来ます。<br>
  - 食品卸売業者やスーパーなどの販売業者は、賞味期限切れで売れなくなった商品を売ることが出来、廃棄にかかるコストをなくすことが出来ます。<br>
  - 個人経営のレストランや加工工場などは安く仕入れることができ、入荷のコストを抑えることが出来ます。<br>
  - 消費者は通常より安い価格で購入することが出来ます。<br>
  - 農家など生産者は、本来なら流通の前段階で廃棄していた作物を出荷でき、売り上げになります。<br>


### 【実装を完了した機能の一覧】
１）ユーザー登録およびログイン機能(devise)<br>
    ユーザー登録しなくても商品一覧や詳細、食品ロスについてなどは閲覧可能<br>
２）ログイン機能(devise)<br>
    メールアドレス、パスワードの入力でログインでき、ログインユーザーは、商品の購入・出品・コメントが可能<br>
３）商品一覧表示、詳細表示、編集機能<br>
    商品の一覧表示、個別の詳細情報、出品商品の編集機能<br>
４）商品出品機能<br>
    出品したい商品をすぐ出品できるように実装<br>
５）商品購入機能<br>
    PAY.JPを利用した商品購入機能の実装方法を習得<br>
６）出品時の画像プレビュー機能<br>
    出品前に投稿画像を確認できる<br>
７）コメント投稿機能<br>
    ログインユーザーのみ投稿可能<br>
８）食品ロス問題提起<br>
    食品ロス問題についての概要、原因、対策を記載<br>
９）スマホレスポンシブ機能<br>
    非Bootstrap<br>
10）テストの実施（model)<br>
    RSpec、factory_bot使用<br>
11）AWSS3に投稿画像を保存<br>
    Heroku上で扱う画像ファイルなどは、仕様で24時間でリセットされるめ、AWSS3上に保存<br>
12）全て著作権フリーの画像を使用<br>
    権利関係で何も問題ないようにするため<br>

### 【開発日数】
作業期間 2020年9月7日 〜 202年11月8日のべ工数 63日/630時間<br>

### 【この先実装したい機能】
・出品者の評価機能、顔写真掲載<br>
・SNS連携（新規登録、ログイン時）<br>
・ジャンル分け一覧表示<br>
・条件検索機能<br>
・問い合わせフォーム<br>
・コメント投稿者のコメント削除機能<br>
・AWSEC2,unicorn,nginxによる自動デプロイ機能<br>
・画像複数投稿機能<br>

### 【連絡先】
久田智大 ヒサダトモヒロ   Gmail / dekirumadeyamenai@gmail.com    twitter / https://twitter.com/tomotech5<br>

### 【参考ページ紹介】
トップページ  https://gyazo.com/d36f849feced8eae164c1abaa6b96372<br>
食品ロス説明ページ  https://gyazo.com/c335641bdca176c720f6abec446e997d<br>