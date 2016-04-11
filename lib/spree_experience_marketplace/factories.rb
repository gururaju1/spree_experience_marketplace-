require 'spree_experience_drop_ship/factories'

FactoryGirl.modify do
  factory :experience, :class => Spree::Experience do
    sequence(:name) { |i| "Big Store #{i}" }
    email { Faker::Internet.email }
    first_name 'First'
    last_name 'Last'
    url "http://example.com"
    address
  end
end

FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_marketplace/factories'

  factory :experience_bank_account, class: Spree::EnkAccount do
    experience
    # Details sent to Balanced.
    name 'John Doe'
    account_number '9900000001'
    routing_number '121000358'
    type 'checking'
  end

end