class Customer < ApplicationRecord
  acts_as_paranoid
  enum gender: [:Male, :Female, :Undefined]
  belongs_to :employee
  scope :active, -> { joins(:employee).merge(Employee.active) }
  validates :identification, :first_name, :last_name, :gender, :debt, presence: true

  def full_debt
    "$ #{debt}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_info
    "#{first_name} #{last_name} - $#{debt}"
  end
end
