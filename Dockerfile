# イメージのベースラインにRuby2.7.0を指定
FROM ruby:2.6.5
# Railsに必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y build-essential nodejs
RUN gem install bundler
# ルートディレクトリを作成
RUN mkdir /app
# 作業ディレクトリを指定
WORKDIR /app
# ローカルのGemfileとGemfile.lockをコピー
COPY ./Gemfile /app/Gemfile
COPY ./Gemfile.lock /app/Gemfile.lock
# Gemのインストール実行
RUN bundle install
# カレントディレクトリの内容をコピー
ADD . app