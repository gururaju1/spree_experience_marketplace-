class CreateExperienceBankAccounts < ActiveRecord::Migration
  def change
    create_table :spree_experience_bank_accounts do |t|
      t.string :masked_number
      t.belongs_to :experience
      t.string :token
      t.timestamps
    end
    add_index :spree_experience_bank_accounts, :experience_id
    add_index :spree_experience_bank_accounts, :token
  end
end