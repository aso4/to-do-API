class Api::ItemsController < ApiController
  before_action :authenticated?

  def index
    item = Item.all
    render json: item
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def create
    list = List.find(params[:list_id])
    item = list.items.build(item_params)

    if item.save
      render json: item, status: 201
    else
      render json: { errors: item.errors.full_messages }, status: 422 #:unprocessable_entity
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: item
    else
      render json: { errors: list.errors.full_messages }, status: 422 #:unprocessable_entity
    end
  end

  private

  def item_params
    params.permit(:desc, :completed)
  end
end
