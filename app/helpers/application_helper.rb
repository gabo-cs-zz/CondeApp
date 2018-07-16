module ApplicationHelper
  def full_genders
    Employee.genders.inject({}) do |hash, item|
      hash.merge!("#{item.first}" => item.first)
    end
  end
end
