# README

## Feature
RailsとJavaScriptを用いてチーム２名で作成したオリジナルアプリです。<br>
作成期間は３週間です。<br>
作成期間が短いためシンプルなアプリを目指しました。<br>
好きなものを９つAmazonから選んで共有できるアプリです。<br>
同じ趣味の人を見つけるのに過去のツイートを探したりするのは
面倒だと思い、<br>
一目見れば、その人の事がわかるようにできるものを
目指して作成しました。

下記機能を実装
* SorceryによるTwitterログイン
* Intro.jsによるチュートリアル機能
* JqueryUIとajaxによる位置入れ替え機能
* TwitterAPIのシェア機能
* タイトル編集のajaxでの実装
* AmazonAPIを用いた検索機能

## Ruby version
* See `.ruby-version`.

## Rails version
* See `Gemfile`.

## System dependencies
* Postgres >= 5.6

## Project initiation
* リポジトリのクローン
```
$ git clone git@github.com:ekusuy/portfolio.git
```
* gemのインストール
```
$ bundle install --path vendor/bundle
```

## Database creation
```
$ rake db:create db:reset
```
