json.extract! employee, :id, :identification, :first_name, :last_name, :address, :phone, :gender, :status, :created_at, :updated_at
json.url employee_url(employee, format: :json)
