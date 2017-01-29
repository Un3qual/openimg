source "https://rubygems.org"

ruby "2.4.0"

# -- BEGIN SUSPENDERS GEMS--
gem "autoprefixer-rails"
gem "delayed_job_active_record"
gem "flutie"
gem "honeybadger"
gem "jquery-rails"
gem "normalize-rails", "~> 3.0.0"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 5.0.0"
gem "recipient_interceptor"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "skylight"
gem "sprockets", ">= 3.0.0"
gem "suspenders"
gem "title"
gem "uglifier"
# -- END SUSPENDERS GEMS--
gem "bulma-rails"
gem "carrierwave", "~> 1.0"
gem "fog-aws"

group :development do
  # -- BEGIN SUSPENDERS GEMS--
  gem "listen"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
  # -- END SUSPENDERS GEMS--
end

group :development, :test do
  # -- BEGIN SUSPENDERS GEMS--
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.5"
  # -- END SUSPENDERS GEMS--
end

group :development, :staging do
  # -- BEGIN SUSPENDERS GEMS--
  gem "rack-mini-profiler", require: false
  # -- END SUSPENDERS GEMS--
end

group :test do
  # -- BEGIN SUSPENDERS GEMS--
#  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
  # -- END SUSPENDERS GEMS--
end

group :staging, :production do
  # -- BEGIN SUSPENDERS GEMS--
  gem "rack-timeout"
  # -- END SUSPENDERS GEMS--
end
