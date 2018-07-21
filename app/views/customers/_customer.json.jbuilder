if current_user.email.include? 'gabrielomar'
  json.extract! customer, :id, :identification, :first_name, :last_name, :address, :phone, :gender, :employee_id, :debt, :created_at, :updated_at, :deleted_at
  json.url customer_url(customer, format: :json)
end
