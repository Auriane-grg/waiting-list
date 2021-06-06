class WaitingUser < ApplicationRecord
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :phone, presence: true, format: { with: /\A[0-9]{10}\z/ }
  validates :email, uniqueness: {message: 'This email is already on the waiting list'}, presence: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9]{2,6}\.[A-Za-z]{2,4}\z/ }
end

