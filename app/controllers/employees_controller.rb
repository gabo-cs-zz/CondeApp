class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy, :delete]
  before_action :authenticate_user!

  def index
    if current_user.email == 'gabrielomar2809@gmail.com'
      @employees = Employee.paginate(page: params[:page], per_page: 5)
    elsif current_user.email == 'del@conde.com'
      @employees = Employee.where(status: 0).paginate(page: params[:page], per_page: 5)
    else
      @employees = Employee.where(status: 1).paginate(page: params[:page], per_page: 5)
    end
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

  # Soft delete
  def delete
    @employee.status = 0
    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_url, notice: 'Employee was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:identification, :first_name, :last_name, :address, :phone, :gender)
    end
end
