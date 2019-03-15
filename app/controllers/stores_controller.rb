class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  def index
    @stores = current_user.stores
  end

  def show
    @user = current_user
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    @store.user = current_user
    if @store.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @store.user = current_user
    if @store.update(store_params)
      redirect_to profile_path
    else
      render :update
    end
  end

  def destroy
    @store.destroy
    redirect_to profile_path
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :address, :description, :phone)
  end
end
