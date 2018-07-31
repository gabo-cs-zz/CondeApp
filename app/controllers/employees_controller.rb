class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    (current_user.email.include? 'gabrielomar') ? show_admin : show_no_admin
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
    @customer.user_id = current_user.id
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
       if @employee.destroy
         format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
         format.json { head :no_content }
       else
         format.html { redirect_to employees_url
           flash[:alert] = "Cannot delete an employee who has customer(s) associated" }
         # format.html { redirect_to employees_url }
         format.json { render json: @employee.errors, status: :unprocessable_entity }
       end
     end
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:identification, :first_name, :last_name, :address, :phone, :gender)
    end

    def show_admin
      if params[:gender].present?
       @employees= Employee.with_deleted.where(gender: params[:gender], user_id: current_user.id).paginate(page: params[:page], per_page: 5)
      else
       @employees = Employee.with_deleted.where(user_id: current_user.id).paginate(page: params[:page], per_page: 5)
      end
    end

    def show_no_admin
      if params[:gender].present?
       @employees= Employee.without_deleted.where(gender: params[:gender], user_id: current_user.id).paginate(page: params[:page], per_page: 5)
      else
       @employees = Employee.without_deleted.where(user_id: current_user.id).paginate(page: params[:page], per_page: 5)
      end
    end
end
