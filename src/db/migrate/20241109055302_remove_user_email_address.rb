class RemoveUserEmailAddress < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :email_address, :string
  end
end
