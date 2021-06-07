Ruby Version `3.0.1`

### Installation

Install node dependencies

```shell
yarn install
```

Install bundler

```shell
gem install bundler
```

Use it to install gems

```shell
bundle install
```

Create and configure database

```shell
rails db:create
rails db:migrate
rails active_storage:install
rails db:seed
```

### Running

This app uses foreman to start rails server and webpack-dev-server with one command. The exact commands are specified
in `Procfile`

Run the app

```shell
bundle exec foreman start
```

### Testing

This app uses RSpec

Type `rspec` in the root directory to run all tests

###
Seeds create a user with these credentials:
* email `user1@user.com`
* password `user1@user.com`
