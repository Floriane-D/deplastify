class StoresController < ApplicationController
  def index
    @stores = current_user.stores
  end

  def show
    @store = params[:id]
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
