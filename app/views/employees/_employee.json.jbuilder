if current_user.email.include? 'gabrielomar'
  json.extract! employee, :id, :identification, :first_name, :last_name, :address, :phone, :gender, :created_at, :updated_at, :deleted_at
  json.url employee_url(employee, format: :json)
end
