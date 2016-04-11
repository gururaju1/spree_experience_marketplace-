module Spree
  class ExperienceMarketplaceAbility
    include CanCan::Ability

    def initialize(user)
      user ||= Spree.user_class.new

      if user.experience
        can [:admin, :manage], Spree::ExperienceBankAccount, experience_id: user.experience_id
        can :create, Spree::ExperienceBankAccount
      end
    end
  end
end