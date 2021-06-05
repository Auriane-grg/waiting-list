class WaitingUser < ApplicationRecord
  validates :last_name, presence: { message: "Last name is required" }
  validates :first_name, presence: true
  validates :phone, presence: true, format: { with: /\A[0-9]{10}\z/ }
  validates :email, presence: true, format: { with: /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}/ }
end

