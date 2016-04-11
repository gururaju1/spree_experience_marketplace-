class Spree::Admin::ExperienceBankAccountsController < Spree::Admin::ResourceController

  before_filter :load_experience
  create.before :set_experience

  def new
    @object = @experience.bank_accounts.build
  end

  private

    def load_experience
      @experience = Spree::experience.friendly.find(params[:experience_id])
    end

    def location_after_save
      spree.edit_admin_experience_path(@experience)
    end

    def set_experience
      @object.experience = @experience
    end

end