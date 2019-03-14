class StoresController < ApplicationController
  def index
    @stores = current_user.stores
  end

  def show
    @store = Store.find(params[:id])
    @user = current_user
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    @store.user = current_user
    if @store.save
      redirect_to profile_path # CHANGE THIS IN THE FUTURE!
    else
      render :new
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    @store.user = current_user
    if @store.save
      redirect_to profile_path # CHANGE THIS IN THE FUTURE!
    else
      render :update
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    redirect_to_profile_path
  end

  private

  def store_params
    params.require(:store).permit(:name, :address, :description, :phone)
  end
end
