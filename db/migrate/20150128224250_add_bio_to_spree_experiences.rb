class AddBioToSpreExperiences < ActiveRecord::Migration
  def change
		add_column :spree_experiences, :bio, :text
  end
end