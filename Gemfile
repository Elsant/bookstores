source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.2'
gem 'sqlite3'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_girl_rails', '~> 4.8'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda-context', '~> 1.2', '>= 1.2.2'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
end

gem 'active_model_serializers', '~> 0.10.6'
gem 'rubocop', '~> 0.49.1', require: false
