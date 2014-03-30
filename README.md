# Simple Note
RailsとBackboneを利用したサンプルとして作成した簡単なメモアプリケーションです。
Markdown形式で記述したメモを、ほぼリアルタイムでプレビューしながら編集することができます。

## Versions
| Name        | Version   |
| ---         | ---       |
| Ruby        | 2.1.1     |
| Rails       | 4.1.0.rc1 |
| Backbone.js | 1.1.2     |

# Requirements

- SQLite
- PostgresSQL (For Heroku)

## Usage

```sh
$ git clone https://github.com/joker1007/simple_note
$ cd simple_note
$ bundle install --path vendor/bundle
$ bundle exec rake db:migrate
$ bundle exec rails s
```

## Heroku

```sh
$ git clone https://github.com/joker1007/simple_note
$ cd simple_note
$ heroku apps:create
$ git push heroku master
```
