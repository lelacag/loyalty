class PointsController < ApplicationController
  # before_validation :employee_active on: :create
  # before_action :employee_logged, only: [ :new, :create]


  def new
    @customer = Customer.find(params[:customer_id])
    @point = Point.new

    # Need to fix:
    # to erase admin logged if back button used on create view
    # reset_session
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @point = Point.new(point_params)
    @point.customer_id = @customer.id
    @point.employee_id = session[:current_employee_id]

    if @point.save
      reset_session
      flash[:success] = "Points successfully added"
      redirect_to @customer
    else
      flash.now[:danger] = "Points unsuccessfully added, please check the form"
      render :new
    end
  end

  private
  
  def point_params
    params.require(:point).permit(:point_total)
  end

  # def employee_logged
  #   @employee = Employee.find(params[:id])
  #   unless @employee.id == session[:current_employee_id]
  #     flash[:danger] = "Must log in first"
  #     redirect_to login_path
  #   end
  # end

end
