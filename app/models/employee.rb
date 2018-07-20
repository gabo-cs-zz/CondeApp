class Employee < ApplicationRecord
  before_destroy :warn
  before_update :warn
  enum gender: [:Male, :Female, :Undefined]
  has_many :customers, dependent: :destroy
  def full_name
    "#{first_name} #{last_name}"
  end

  def soft_delete
    update_attribute(:status, 0)
  end

  def warn
    if self.status == 0
      @sw = false
      Customer.all.each { |c| @sw = true if (c.employee_id == self.id) }
      update_attribute(:status, 1) if @sw # There's a customer associated
    end
  end

end
