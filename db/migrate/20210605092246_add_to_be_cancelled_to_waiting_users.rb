class AddToBeCancelledToWaitingUsers < ActiveRecord::Migration[6.0]
  def change

    add_column :waiting_users, :to_be_cancelled, :boolean, :default => false
  end
end
