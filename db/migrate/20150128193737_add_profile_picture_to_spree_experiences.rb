class AddProfilePictureColumnsToSpreeExperiences < ActiveRecord::Migration
  def change
		add_attachment :spree_experiences, :profile_picture
  end
end