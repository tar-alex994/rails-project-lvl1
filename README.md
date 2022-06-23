### Hexlet tests and linter status:
[![Actions Status](https://github.com/tar-alex994/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/tar-alex994/rails-project-lvl1/actions)
[![CI Status](https://github.com/tar-alex994/rails-project-lvl1/actions/workflows/main.yml/badge.svg)](https://github.com/tar-alex994/rails-project-lvl1/actions/workflows/main.yml)

# HexletCode

HexletCode гем помогает удобно и быстро генерировать html формы.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add hexlet_code

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install hexlet_code

## Usage

`User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user, url: '/users' do |f|
  f.input :name
  f.input :job, as: :text
end`

В итоге поличтся следущий html:
 `<form action="/users" method="post">
   <input name="name" type="text" value="rob">
   <textarea cols="20" rows="40" name="job">hexlet</textarea>
 </form>`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Сообщения об ошибках и запросы на извлечение приветствуются на GitHub по адресу https://github.com/tar-alex994/rails-project-lvl1.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

