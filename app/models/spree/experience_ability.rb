module Spree
  class ExperienceAbility
    include CanCan::Ability

    def initialize(user)
      user ||= Spree.user_class.new

      if user.experience
        if SpreeExperienceMarketplace::Engine.spree_digital_available?
          # can [:admin, :manage], Spree::Digital, variant: { experience_ids: user.experience_id }
          can [:admin, :manage], Spree::Digital do |digital|
            digital.variant.experience_ids.include?(user.experience_id)
          end
          can :create, Spree::Digital
        end
        can [:admin, :manage], Spree::Image do |image|
          image.viewable.product.experience_ids.include?(user.experience_id)
        end
        can :create, Spree::Image
        if SpreeExperienceMarketplace::Engine.spree_group_price_available?
          # can [:admin, :manage], Spree::GroupPrice, variant: { experience_ids: user.experience_id }
          can [:admin, :manage], Spree::GroupPrice do |price|
            price.variant.experience_ids.include?(user.experience_id)
          end
        end
        if SpreeExperienceMarketplace::Engine.spree_related_products_available?
          # can [:admin, :manage], Spree::Relation, relatable: { experience_ids: user.experience_id }
          can [:admin, :manage], Spree::Relation do |relation|
            relation.relatable.experience_ids.include?(user.experience_id)
          end
        end
        # TODO: Want this to be inline like:
        # can [:admin, :manage, :stock], Spree::Product, experiences: { id: user.experience_id }
        can [:admin, :manage, :stock], Spree::Product do |product|
          product.experience_ids.include?(user.experience_id)
        end
        can [:admin, :create, :index], Spree::Product
        # can [:admin, :manage], Spree::ProductProperty, product: { experience_ids: user.experience_id }
        can [:admin, :manage, :stock], Spree::ProductProperty do |property|
          property.product.experience_ids.include?(user.experience_id)
        end
        can [:admin, :index, :read], Spree::Property
        can [:admin, :read], Spree::Prototype
        can [:admin, :manage, :read, :ready, :ship], Spree::Shipment, order: { state: 'complete' }, stock_location: { experience_id: user.experience_id }
        can [:admin, :create, :update], :stock_items
        can [:admin, :manage], Spree::StockItem, stock_location_id: user.experience.stock_locations.pluck(:id)
        can [:admin, :manage], Spree::StockLocation, experience_id: user.experience_id
        can :create, Spree::StockLocation
        can [:admin, :manage], Spree::StockMovement, stock_item: { stock_location_id: user.experience.stock_locations.pluck(:id) }
        can :create, Spree::StockMovement
        can [:admin, :update], Spree::Experience, id: user.experience_id
        # TODO: Want this to be inline like:
        # can [:admin, :manage], Spree::Variant, experience_ids: user.experience_id
        can [:admin, :create, :index], Spree::Variant
				can [:admin, :manage], Spree::Variant do |variant|
          variant.experience_ids.include?(user.experience_id)
        end
      end

      if SpreeExperienceMarketplace::Config[:allow_signup]
        can :create, Spree::experience
      end

      if SpreeExperienceMarketplace::Engine.ckeditor_available?
        can :access, :ckeditor

        can :create, Ckeditor::AttachmentFile
        can [:read, :index, :destroy], Ckeditor::AttachmentFile, experience_id: user.experience_id

        can :create, Ckeditor::Picture
        can [:read, :index, :destroy], Ckeditor::Picture, experience_id: user.experience_id
      end
    end

  end
end

