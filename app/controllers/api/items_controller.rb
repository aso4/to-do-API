class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
    list = List.find(params[:list_id])
    item = list.items.build(item_params)

    if item.save
      render json: item, status: 201
    else
      render json: { errors: item.errors.full_messages }, status: 422 #:unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:desc)
  end
end
