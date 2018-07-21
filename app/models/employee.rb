class Employee < ApplicationRecord
  acts_as_paranoid
  enum gender: [:Male, :Female, :Undefined]
  has_many :customers, :dependent => :restrict_with_error
  scope :active, -> { where(deleted: false) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
