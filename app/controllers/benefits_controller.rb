  class BenefitsController < ApplicationController
  def index
    @store = Store.find(params[:store_id])
    @benefits = policy_scope(Benefit)
    authorize @benefit
  end

  def new
    @store = Store.find(params[:store_id])
    @benefit = Benefit.new(store: @store)
    authorize @benefit
  end

  def create
    @benefit = Benefit.new(benefit_params)
    @benefit.store = Store.find(params[:store_id])
    dates_array = params["daterange"].split(" - ")
    start_date = Date.strptime(dates_array[0], '%m/%d/%Y')
    end_date = Date.strptime(dates_array[1], '%m/%d/%Y')
    @benefit.start_date = start_date
    @benefit.end_date = end_date
    authorize @benefit
    if @benefit.save
      redirect_to store_path(@benefit.store)
    else
      render :new
    end
  end

  def edit
    @benefit = Benefit.find(params[:id])
    @store = Store.find(params[:store_id])
    @benefit.store = @store
    authorize @benefit
  end

  def update
    @benefit = Benefit.find(params[:id])
    @store = Store.find(params[:store_id])
    @benefit.store = @store
    dates_array = params["daterange"].split(" - ")
    start_date = Date.strptime(dates_array[0], '%m/%d/%Y')
    end_date = Date.strptime(dates_array[1], '%m/%d/%Y')
    @benefit.start_date = start_date
    @benefit.end_date = end_date
    # @benefit.name = params[:name]
    # @benefit.description = params[:description]
    authorize @benefit
    if @benefit.update(benefit_params)
      redirect_to store_path(@benefit.store) # CHANGE THIS IN THE FUTURE!
    else
      render :update
    end
  end

  def destroy
    @benefit = Benefit.find(params[:id])
    @store = Store.find(params[:store_id])
    authorize @benefit
    @benefit.destroy
    redirect_to store_path(@store)
  end

  private

  def benefit_params
    params.require(:benefit).permit(:name, :description, :start_date, :end_date)
  end
end
