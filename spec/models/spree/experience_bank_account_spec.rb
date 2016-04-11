require 'spec_helper'

describe Spree::ExperienceBankAccount do

  it { should belong_to(:experience) }

  it { should validate_presence_of(:masked_number) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:experience) }
  it { should validate_presence_of(:token) }
  it { should validate_uniqueness_of(:token) }

end