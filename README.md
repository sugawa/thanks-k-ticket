Thanks K Ticket
===============

Kオケ第2回演奏会のチケットフォーム

# ローカル環境の構築

- Ruby 2.1.2
- MySQL 5.5 ?
- Mac OSX

```bash
$ git clone git@github.com:sugawa/thanks-k-ticket.git
$ cd thanks-k-ticket
$ bundle install
$ cp config/database.sample.yml config/database.yml
$ vim config/database.yml
$ bin/rake db:create db:migrate
$ bin/rails s
$ open http://0.0.0.0:3000/
```
