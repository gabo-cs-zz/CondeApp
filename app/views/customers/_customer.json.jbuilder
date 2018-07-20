json.extract! customer, :id, :identification, :first_name, :last_name, :address, :phone, :gender, :status, :employee_id, :debt, :created_at, :updated_at
json.url customer_url(customer, format: :json)
