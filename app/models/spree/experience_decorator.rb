Spree::Experience.class_eval do

	attr_accessor :first_name, :last_name, :merchant_type
  
	has_many :bank_accounts, class_name: 'Spree::ExperienceBankAccount'
	has_attached_file :profile_picture, dependent: :destroy, :styles => {:medium => "300x300>", :thumb => "100x100>"}, :path => ":rails_root/public/assets/profile_pictures/:style/:filename", :url => "/assets/profile_pictures/:style/:filename"
 validates_attachment :profile_picture, :content_type => { :content_type => /\Aimage\/.*\Z/ }, :size => { :in => 0..500.kilobytes }

  validates :tax_id, length: { is: 9, allow_blank: true }

  before_create :assign_name

  private

  def assign_name
    self.address = Spree::Address.default     unless self.address.present?
    self.address.first_name = self.first_name unless self.address.first_name.present?
    self.address.last_name = self.last_name   unless self.address.last_name.present?
  end

  def stripe_recipient_setup
    return if self.tax_id.blank? and self.address.blank?

    recipient = Stripe::Recipient.create(
      :name => (self.merchant_type == 'business' ? self.name : "#{self.address.first_name} #{self.address.last_name}"),
      :type => (self.merchant_type == 'business' ? 'corporation' : "individual"),
      :email => self.email,
      :bank_account => self.bank_accounts.first.try(:token)
    )

    if new_record?
      self.token = recipient.id
    else
      self.update_column :token, recipient.id
    end
  end

  def stripe_recipient_update
    unless new_record? or !changed?
      if token.present?
        rp = Stripe::Recipient.retrieve(token)
        rp.name  = name
        rp.email = email
        if tax_id.present?
          rp.tax_id = tax_id
        end
        rp.bank_account = bank_accounts.first.token if bank_accounts.first
        rp.save
      else
        stripe_recipient_setup
      end
    end
  end

end