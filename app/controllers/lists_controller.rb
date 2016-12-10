class ListsController < ApplicationController
  def edit
  end

  def index
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params.require(:list).permit(:name))
    @list.user = current_user
  end
end
