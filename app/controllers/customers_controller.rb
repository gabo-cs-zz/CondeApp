class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    (current_user.email.include? 'gabrielomar') ? show_admin : show_no_admin
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:identification, :first_name, :last_name, :address, :phone, :gender, :employee_id, :debt)
    end

    def show_admin
      if params[:gender].present?
       @customers= Customer.with_deleted.where(gender: params[:gender]).paginate(page: params[:page], per_page: 5)
      else
       @customers = Customer.with_deleted.paginate(page: params[:page], per_page: 5)
      end
    end

    def show_no_admin
      if params[:gender].present?
       @customers= Customer.without_deleted.where(gender: params[:gender]).paginate(page: params[:page], per_page: 5)
      else
       @customers = Customer.without_deleted.paginate(page: params[:page], per_page: 5)
      end
    end
end
