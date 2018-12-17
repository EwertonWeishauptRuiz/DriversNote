class UsersController < ApplicationController
  before_action :set_user
  
  def order_beacons    
  end

  def add_beacons_to_order
  end

  def confirm_address       
  end

  def confirm_order    
  end

  def show; end

  private 
  def set_user
    @user = User.find(params[:id])    
  end
end
