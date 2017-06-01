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
      render status: 201, json: {
      message: "Successfully created  list.",
      todo_list: list
    }.to_json
      respond_to do |format|
        format.html
        # format.json { render json: {status: 201, item: item}}
        format.json { render json: item}
      end
    else
      render json: { message: "Failed to create item." }
    end
  end

  def destroy
    item = Item.find (params[:id])
    if Item.destroy(params[:id])
      msg = {:status => 204, :deleted => item.name}
      render :json => msg
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
