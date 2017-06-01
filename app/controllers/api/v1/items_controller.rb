class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show

  end

  def update

  end

  def destroy

  end
end
