class UsersController < ApplicationController
  def order_beacons
    @user = User.find(params[:id])
  end

  def add_beacons_to_order

  end
end
