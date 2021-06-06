class RemoveQueuePositionToWaitingUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :waiting_users, :queue_position
  end
end
