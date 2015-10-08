class BidsController < ApplicationController

  before_action :authenticate_user!

  def create

    @item     = Item.find params[:item_id]
    
    @bid      = Bid.new bid_params
    @bid.item = @item
    @bid.user = current_user


    if @bid.save
      redirect_to item_path(@item), notice: "Bid submitted!"
    else
      flash[:alert] = "Comment not added"
      render "/items/show"
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:bid_amount)
  end

end
