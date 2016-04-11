class Spree::ExperiencesController < Spree::StoreController

  before_filter :check_if_experience, only: [:create, :new]
  # ssl_required

	def index
		@experiences = Spree::Experience.all
	end

	def show
	  @experience = Spree::Experience.find(params[:id])
	end

  def create
    authorize! :create, Spree::Experience

    @experience = Spree::Experience.new(experience_params)

    # Dont sign in as the newly created user if users already signed in.
    unless spree_current_user
      # Find or create user for email.
      if @user = Spree.user_class.find_by_email(params[:experience][:email])
        unless @user.valid_password?(params[:experience][:password])
          flash[:error] = Spree.t('experience_registration.create.invalid_password')
          render :new and return
        end
      else
        @user = Spree.user_class.new(email: params[:experience][:email], password: params[:experience].delete(:password), password_confirmation: params[:experience].delete(:password_confirmation))
        @user.save!
        session[:spree_user_signup] = true
      end
      sign_in(Spree.user_class.to_s.underscore.gsub('/', '_').to_sym, @user)
      associate_user
    end

    # Now create experience.

    @experience.email = spree_current_user.email if spree_current_user

    if @experience.save
      flash[:success] = Spree.t('experience_registration.create.success')
      redirect_to spree.admin_products_path
    else
      render :new
    end
  end

  def new
    authorize! :create, Spree::Experience
    @experience = Spree::Experience.new
    @experience.address = Spree::Address.default
  end

  private

  def check_if_experience
    if spree_current_user and spree_current_user.experience?
      flash[:error] = Spree.t('experience_registration.already_signed_up')
      redirect_to spree.admin_products_path and return
    end
  end

  def experience_params
    params.require(:experience).permit(:first_name, :name, :last_name, :tax_id, :profile_picture)
  end

end