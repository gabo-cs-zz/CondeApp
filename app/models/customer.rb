class Customer < ApplicationRecord
  enum gender: [:Male, :Female, :Undefined]
  belongs_to :employee
  def full_debt
    "$ #{debt}"
  end
end
