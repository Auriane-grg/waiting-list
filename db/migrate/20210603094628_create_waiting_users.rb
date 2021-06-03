class CreateWaitingUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :waiting_users do |t|
      t.string :phone
      t.string :last_name
      t.string :first_name
      t.string :email
      t.integer :queue_position

      t.timestamps
    end
  end
end
