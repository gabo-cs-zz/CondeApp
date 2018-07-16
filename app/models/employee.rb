class Employee < ApplicationRecord
  enum gender: [:Male, :Female, :Undefined]
  has_many :customers
  def full_name
    "#{first_name} #{last_name}"
  end
end
