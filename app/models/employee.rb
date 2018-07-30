class Employee < ApplicationRecord
  acts_as_paranoid
  enum gender: [:Male, :Female, :Undefined]
  has_many :customers, :dependent => :restrict_with_error
  scope :active, -> { where(deleted: false) }
  validates :identification, :first_name, :last_name, :gender, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def customers_associated
    list = []
    Customer.all.each.with_index { |c, i| list << i+1 << " " << c.full_info << ", " if c.employee_id == self.id }
    list.pop
    list.empty? ? 'None.' : list
  end
end
