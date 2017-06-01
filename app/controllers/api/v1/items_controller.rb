class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item, status: 201
    else
      render json: { message: "Failed to create item." }
    end
  end

  def destroy
    item = Item.find (params[:id])
    item_name = item.name
    if Item.destroy(params[:id])
      render status: 204, json: {name: item_name}
    else
      msg = {msg: "There was a problem deleting that item."}
      render :json => msg
    end
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end
end
