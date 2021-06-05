class AddLastValidationToWaitingUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :waiting_users, :last_validation, :integer
  end
end
