require 'spec_helper'
require 'cancan/matchers'
require 'spree/testing_support/ability_helpers'

describe Spree::ExperienceMarketplaceAbility do

  let(:user) { create(:user, experience: create(:experience)) }
  let(:ability) { Spree::ExperienceMarketplaceAbility.new(user) }
  let(:token) { nil }

  context 'for ExperienceBankAccount' do
    context 'requested by non experience user' do
      let(:ability) { Spree::ExperienceMarketplaceAbility.new(create(:user)) }
      let(:resource) { Spree::ExperienceBankAccount.new }

      it_should_behave_like 'admin denied'
      it_should_behave_like 'access denied'
    end

    context 'requested by experiences user' do
      let(:resource) { Spree::ExperienceBankAccount.new({experience: user.experience}, without_protection: true) }
      it_should_behave_like 'admin granted'
      it_should_behave_like 'access granted'
    end

    context 'requested by another experiences user' do
      let(:resource) { Spree::ExperienceBankAccount.new({experience: create(:experience)}, without_protection: true) }
      it_should_behave_like 'create only'
    end
  end

end