class BenefitsController < ApplicationController
  def new
    @benefit = Benefit.new
    @store = Store.find(params[:store_id])
  end

  def create
    @benefit = Benefit.new(benefit_params)
    @benefit.store = Store.find(params[:store_id])
    dates_array = params["daterange"].split(" - ")
    start_date = Date.strptime(dates_array[0], '%m/%d/%Y')
    end_date = Date.strptime(dates_array[1], '%m/%d/%Y')
    @benefit.start_date = start_date
    @benefit.end_date = end_date
    if @benefit.save
      redirect_to store_path(@benefit.store) # CHANGE THIS IN THE FUTURE!
    else
      render :new
    end
  end

  def edit
    @benefit = Benefit.find(params[:id])
    @store = Store.find(params[:store_id])
  end

  def update
    @benefit = Benefit.find(params[:id])
    @benefit.store = Store.find(params[:id])
    dates_array = params["daterange"].split(" - ")
    start_date = Date.strptime(dates_array[0], '%m/%d/%Y')
    end_date = Date.strptime(dates_array[1], '%m/%d/%Y')
    @benefit.start_date = start_date
    @benefit.end_date = end_date
    if @benefit.save
      redirect_to store_path(@benefit.store) # CHANGE THIS IN THE FUTURE!
    else
      render :update
    end
  end

  def destroy
    @benefit = Benefit.find(params[:id])
    @benefit.destroy
    redirect_to_profile_path
  end

  private

  def benefit_params
    params.require(:benefit).permit(:name, :description, :start_date, :end_date)
  end
end
