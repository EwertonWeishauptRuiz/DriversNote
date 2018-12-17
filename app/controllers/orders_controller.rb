class OrdersController < ApplicationController 
  before_action :set_order, only:[:show, :update]
    
  def new
    @user = User.find(params[:user_id])      
  end  

  def create
    @user = User.find(params[:user_id])      
    @order = @user.orders.build(status: "pending")      
    if @order.save
      redirect_to [@user, @order]
    else
      render :upgrade
    end
  end

  def show
    @user = User.find(params[:user_id])      
  end

  def update    
    @user = User.find(params[:user_id])      
    if params[:commit] == "+"
      @order.add_beacon
    elsif params[:commit] == "-"
      @order.subtract_beacon
    elsif params[:commit] == "confirm"
      @order.update_attributes(order_params)
      redirect_to [@user, @order, :confirm_address]
    end
  end

  def upgrade; end

  def confirm_address
    @user = User.find(params[:user_id])      
    @order = @user.orders.find(params[:order_id])
    if request.get? 
      @address = @order.address || @order.user.addresses.first      
    end
    if request.post?
      @order.update_attributes(address_id: params[:address_id])      
      redirect_to [@user, @order, :confirm_order]      
    end
  end

  def choose_address
    @user = User.find(params[:user_id])      
    @order = @user.orders.find(params[:order_id])
    @address = @user.addresses
  end

  def confirm_order
    @user = User.find(params[:user_id])      
    @order = @user.orders.find(params[:order_id])
  end

  def order_completion
    @user = User.find(params[:user_id])      
    @order = @user.orders.find(params[:order_id])
    @order.complete_order    
  end

  private
  def order_params
    params.require(:order).permit(:beacons, :address_id)
  end

  def set_order
    @order = Order.find(params[:id])
  end  
end

