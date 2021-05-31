# アプリ名: :bellhop_bell: roomin 

<h4> URL: https://roomin.herokuapp.com</h4>

# :thinking: どんなアプリか
ホテルでルームサービスを頼むときに使えるアプリです

# なぜ作ったのか？
ホテルで働いてる時、お客さんの５０％以上が全世界からきた外国人でしたが、<br>
多くの人が日本人にはわかりづらい英語のアクセントを持っていてコミュニーケーションとるのが難し時が多く、:exploding_head:<br>
（例えばとても忙しいのにだったの毛布一枚が欲しいとの話を電話で10分もしゃべらないといけなかったりする場面も度々ありました、）<br>

各言語で備品の名前があり、写真も入ってる注文アプリがあればお客さんは簡単にルームサービスができるし<br>
従業員も無駄が減るので仕事面で効率が上がると思いこのアプリを制作してみました。<br>
オリピックを迎えてはいるものの、コロナの影響で従業員を減らしているホテルがあるなら<br>
使って頂きたいと思います。


# イメージ画像
  :<img width="359" alt="スクリーンショット 2021-05-25 14 11 57" src="https://user-images.githubusercontent.com/65806682/119585163-19173f80-be05-11eb-8dfb-cd49cd0931a0.png">:|:<img width="376" alt="スクリーンショット 2021-05-31 14 41 16" src="https://user-images.githubusercontent.com/65806682/120145414-6d178f00-c21e-11eb-9bdc-11f99f8dc9e8.png">:
 
<img width="788" alt="スクリーンショット 2021-05-25 14 13 43" src="https://user-images.githubusercontent.com/65806682/119585172-1f0d2080-be05-11eb-8440-85c7fe6f51cb.png">
<img width="1266" alt="スクリーンショット 2021-05-25 14 14 00" src="https://user-images.githubusercontent.com/65806682/119585179-22081100-be05-11eb-9d0a-95a43110aeca.png">


# 目次
- 使用技術
- ER 図
- 実装機能
- 工夫したポイント
- 苦労したポイント
- 今後の課題

# 使用技術
#### HTML/CSS/Sass/Javascript/Ruby on Rails/postgreSQL/AWS

##### バージョン
- ruby 2.7.2
- rails 'rails', '~> 6.0.3', '>= 6.0.3.6'
- PostgreSQL 13.2

# ER図

![er_f](https://user-images.githubusercontent.com/65806682/119762362-8223b380-bee8-11eb-9e72-3f23f8f39f7a.png)

# 実装機能
## `ユーザー`

|ログイン（devise） 　　　　　     |　 　     　 |　　　　　　　　    　|                
|    ---        | ---        | ---               |    
|ログイン情報    |部屋番号　　  |　　　　　　　　      |              
|   　         |password     |                   |        
|              |認証方法カスタマイズ    | 新規登録を消去      |       
|   　         |    　　             |パスワード再設定機能の削除|     
|言語選択      |     i18n   |日本語、英語、中国語（簡体）、タイ語  |      

|備品申し込み|　 　     　 |　　　　　　　　    　|                   |
|    ---        | ---        | ---               | ---              |   
|備品の種類　     |部屋、風呂場、カウンター別に分類|                 |                    |
| 　　　　　     |備品オーダーボタン　　 　     　 |　　　　　　　　    　|                   |
| 　　　　　     |確認画面　　|　　　　　　　　    　|                   |
| 　　　　　     |管理者へのメール通知機能(Action Mailer)|管理者のメールアカウント（gmail)|                   |
|              |                                   |メール本文 |部屋番号、名前、備品の名前＋個数のセットに入るように装着|


|問い合わせフォーム |　 　     　 |　　　　　　　　    　|                  
|    ---        | ---        | ---               |
|申し込みフォーム|                 |                  | 
|確認画面                      | | | 
|投稿機能                      |データべースには保存しない |メール通知のみ | 
|管理者へのメール通知機能   |管理者のメールアカウント  |gmail  |
|                     |メール本文              |内容    | 
|                     |                      |画像      |        
|                     |                      |部屋番号と名前  |  
## `管理者（Active Admin)`

|パスワード発行（アカウント作成） 　　　　　     |　 　     　 |　　　　　　　　    　|                  
|    ---        | ---        | ---               |
|ユーザーアカウントを作成する個数   |　 　     　 |　　　　　　　　    　|               
|パスワードのPDF生成ボタン 　　　　|ユーザーアカウントの作成  |パスワードはランダム生成|                   
| 　　　　　        　     　 |　　　　　　　　    　|有効期限１ヶ月        |       
| 　　　　　  　 　     　 |QRコードの作成 　　    |アプリのURL、パスワード付き|  
| 　　　　　    　     　 |PDFの作成　　　　　　　|QRコード             |   
| 　　　　　     |　 　     　　　　　　　　    　|アプリのURL、パスワード   |    
| 　　　　　     |　 　     　　　　　　　    　|有効期限設定         |     

|備品管理機能 |　 　                |    
|    ---        | ---        |  
|               |備品投稿  |
|               |備品編集               |
|               |備品一覧               |
|               |詳細画面               |

|注文管理機能 |　 　    　　　　　　  |       |              
|    ---          | ---               | ---        |
|                 |編集機能 |対応状況|
|                |         |対応指示した従業員の名前 | 
|                |         |対応した従業員の名前 |
|                |一覧表示               |       |
|                | 詳細          |       |
   

|従業員の管理機能 |　 　    　　　　　　  |       |              
|    ---          | ---               | ---        |
|                 |作成 |  |
|                |一覧      |          | 
|                |編集       |表示非表示 |


# 工夫したポイント
#### パスワード発行（アカウント作成） 、認証方法カスタマイズ 
- 新く作られたアカウントの有効期限は１ヶ月にしました。ユーザーはホテルの宿泊者なのでactivate（ログイン）できてからは１週間後にアカウントは自動的に無効になるようにしました。
- 管理者が最初のアカウント生成のときにランダムで作られたpasswordをQRコードに入れて<br>
  ユーザーはQRコードだけでログインできるようにしました。（個人を特定するために部屋番号と名前の入力は必要です。）
#### 言語選択  i18n
- ５カ国の言語でアプリが利用できるようにしました。

# 苦労したポイント
- 
# 今後の課題
- 最初から貸し出せる備品の個数を入れておいて０になったら自動的に"在庫なし"に変わるようにしたいと思います。
- 実際に貸し出した各備品の個数を集計できるようにしたら、ホテルの経費削減のために役に立つかもしれないと思います。

