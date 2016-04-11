class Spree::Admin::ExperienceMarketplaceSettingsController < Spree::Admin::BaseController

  def edit
    @config = Spree::ExperienceMarketplaceConfiguration.new
  end

  def update
    config = Spree::ExperienceMarketplaceConfiguration.new

    params.each do |name, value|
      next unless config.has_preference? name
      config[name] = value
    end

    flash[:success] = Spree.t('admin.experience_marketplace_settings.update.success')
    redirect_to spree.edit_admin_experience_marketplace_settings_path
  end

end