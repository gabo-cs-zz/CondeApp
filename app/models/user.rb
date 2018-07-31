class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true
  validates :business_name, presence: true

  def employees_created_by_user
    list = []
    Employee.all.each.with_index { |e, i| list << i+1 if e.user_id == self.id }
    list.empty? ? 'None.' : list.size
  end

  def customers_created_by_user
    list = []
    Customer.all.each.with_index { |c, i| list << i+1 if c.user_id == self.id }
    list.size
  end

end
