class ItemsController < ApplicationController
  def edit
  end

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params.require(:list).permit(:name))
    #@item.user = current_user
  end

  def show
  end
end
