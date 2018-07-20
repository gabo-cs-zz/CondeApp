class Customer < ApplicationRecord
  enum gender: [:Male, :Female, :Undefined]
  belongs_to :employee
  def full_debt
    "$ #{debt}"
  end

  def soft_delete
    update_attribute(:status, 0)
  end
end
