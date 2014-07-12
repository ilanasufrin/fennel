class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(new_item_params)
    if @item.save
      redirect_to @item
    else
      render :new, alert: "YOU SUCK AT UPLOADING"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def new_item_params
    params.require(:item).permit(:description, :location, :photo)
  end
end
