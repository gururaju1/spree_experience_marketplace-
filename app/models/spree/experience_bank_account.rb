module Spree
  class ExperienceBankAccount < ActiveRecord::Base

    attr_accessor :account_number, :routing_number

    belongs_to :experience

    validates :country_iso,    presence: true
    validates :masked_number,  presence: true
    validates :name,           presence: true
    validates :experience,       presence: true
    validates :token,          presence: true, uniqueness: true

  end
end