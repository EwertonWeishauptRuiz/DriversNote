class AddressesController < ApplicationController
  
  def new        
    @user = User.find(params[:user_id])
    @address = @user.addresses.new
  end

  def show        
    @user = User.find(params[:user_id])
    @address = @user.addresses.first
  end

  def update
    raise params.to_yaml
  end

  def create
    @user = User.find(params[:user_id])      
    @address = @user.addresses.new(address_params)      
    if @address.save
      redirect_to [@user, @user.orders.where(status: "pending").last, :choose_address]
    else
      render :new
    end
  end
  private 
  def address_params
    params.require(:address).permit(:full_name, :address1, :address2, :postal_code, :city, :country)
  end
end
