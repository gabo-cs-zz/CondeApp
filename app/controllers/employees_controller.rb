class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if current_user.email == 'gabrielomar2809@gmail.com'
      @employees = Employee.all.paginate(page: params[:page], per_page: 5)
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

  def destroy
    if @sw
      redirect_to employees_url, alert: 'You cannot delete an employee who has customers associated.'
      @sw = false
    else
      @employee.soft_delete
      respond_to do |format|
        format.json { head :no_content }
        format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
        format.js { render :js => "console.log(#{@sw})" }
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
end
