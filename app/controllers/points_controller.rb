class PointsController < ApplicationController

  def new
    @customer = Customer.find(params[:customer_id])
    @point = Point.new
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @point = Point.new(point_params)
    @point.customer_id = @customer.id
    if @point.save
      redirect_to @customer
    else
      render 'show'
    end
  end

  def add
  end

  private
  
  def point_params
    params.require(:point).permit(:point_total, :admin_id, :customer_id)
  end

end
