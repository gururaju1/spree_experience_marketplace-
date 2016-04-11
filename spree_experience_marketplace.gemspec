# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_experience_marketplace'
  s.version     = '3.0.7'
  s.summary     = 'spree_experience_marketplace'
  s.description = 'spree_experience_marketplace'
  s.required_ruby_version = '>= 2.0.0'

  s.author    = 'gururaju1'
  s.email     = 'gururaju57@gmail.com'
  s.homepage  = 'https://ide.c9.io/chandananc/spreedemo'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  #s.add_dependency 'spree_core', '~> 3.0.7'

  #s.add_development_dependency 'capybara', '~> 2.4'
  #s.add_development_dependency 'coffee-rails'
  #s.add_development_dependency 'database_cleaner'
  #s.add_development_dependency 'factory_girl', '~> 4.5'
  #s.add_development_dependency 'ffaker'
  #s.add_development_dependency 'rspec-rails',  '~> 3.1'
  #s.add_development_dependency 'sass-rails', '~> 5.0.0.beta1'
  #s.add_development_dependency 'selenium-webdriver'
  #s.add_development_dependency 'simplecov'
  #s.add_development_dependency 'sqlite3'
  
   if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<stripe>, [">= 0"])
      s.add_runtime_dependency(%q<spree_core>, [">= 2.4.3.beta"])
      s.add_runtime_dependency(%q<spree_experience_drop_ship>, [">= 0"])
      s.add_development_dependency(%q<capybara>, ["~> 2.2"])
      s.add_development_dependency(%q<coffee-rails>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>, [">= 0"])
      s.add_development_dependency(%q<factory_girl>, ["~> 4.2"])
      s.add_development_dependency(%q<ffaker>, [">= 0"])
      s.add_development_dependency(%q<launchy>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.99"])
      s.add_development_dependency(%q<sass-rails>, ["~> 4.0.2"])
      s.add_development_dependency(%q<selenium-webdriver>, [">= 0"])
      s.add_development_dependency(%q<shoulda-matchers>, [">= 0"])
      s.add_development_dependency(%q<spree_digital>, [">= 0"])
      s.add_development_dependency(%q<spree_editor>, [">= 0"])
      s.add_development_dependency(%q<spree_group_pricing>, [">= 0"])
      s.add_development_dependency(%q<spree_related_products>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<vcr>, [">= 0"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
    else
      s.add_dependency(%q<stripe>, [">= 0"])
      s.add_dependency(%q<spree_core>, [">= 2.4.3.beta"])
      s.add_dependency(%q<spree_experience_drop_ship>, [">= 0"])
      s.add_dependency(%q<capybara>, ["~> 2.2"])
      s.add_dependency(%q<coffee-rails>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<database_cleaner>, [">= 0"])
      s.add_dependency(%q<factory_girl>, ["~> 4.2"])
      s.add_dependency(%q<ffaker>, [">= 0"])
      s.add_dependency(%q<launchy>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.99"])
      s.add_dependency(%q<sass-rails>, ["~> 4.0.2"])
      s.add_dependency(%q<selenium-webdriver>, [">= 0"])
      s.add_dependency(%q<shoulda-matchers>, [">= 0"])
      s.add_dependency(%q<spree_digital>, [">= 0"])
      s.add_dependency(%q<spree_editor>, [">= 0"])
      s.add_dependency(%q<spree_group_pricing>, [">= 0"])
      s.add_dependency(%q<spree_related_products>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<vcr>, [">= 0"])
      s.add_dependency(%q<webmock>, [">= 0"])
    end
  else
    s.add_dependency(%q<stripe>, [">= 0"])
    s.add_dependency(%q<spree_core>, [">= 2.4.3.beta"])
    s.add_dependency(%q<spree_experience_drop_ship>, [">= 0"])
    s.add_dependency(%q<capybara>, ["~> 2.2"])
    s.add_dependency(%q<coffee-rails>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<database_cleaner>, [">= 0"])
    s.add_dependency(%q<factory_girl>, ["~> 4.2"])
    s.add_dependency(%q<ffaker>, [">= 0"])
    s.add_dependency(%q<launchy>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.99"])
    s.add_dependency(%q<sass-rails>, ["~> 4.0.2"])
    s.add_dependency(%q<selenium-webdriver>, [">= 0"])
    s.add_dependency(%q<shoulda-matchers>, [">= 0"])
    s.add_dependency(%q<spree_digital>, [">= 0"])
    s.add_dependency(%q<spree_editor>, [">= 0"])
    s.add_dependency(%q<spree_group_pricing>, [">= 0"])
    s.add_dependency(%q<spree_related_products>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<vcr>, [">= 0"])
    s.add_dependency(%q<webmock>, [">= 0"])
   end
  end
