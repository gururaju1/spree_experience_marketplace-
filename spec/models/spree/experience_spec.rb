require 'spec_helper'

describe Spree::Experience do

  it { should have_many(:bank_accounts) }

end