class AddressesController < ApplicationController
  before_action :set_user, except: [:update]

  def new            
    @address = @user.addresses.new
  end

  def show            
    @address = @user.addresses.first
  end

  def update; end

  def create    
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

  def set_user
    @user = User.find(params[:user_id])
  end
end
