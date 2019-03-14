class WorkingHoursController < ApplicationController

  def index
    @working_hours = WorkingHours.all
  end

  def show
    @working_hour = WorkingHour.find(params[:id])
  end

  def new
    @store = Store.find(params[:store_id])
    @working_hour = WorkingHour.new

  end

  def create
      @store = Store.find(params[:store_id])
      @working_hour = WorkingHour.new
      @working_hour.store = @store
      @working_hour.save
      if @working_hour.save
        redirect to store_path
        else render :new
      end
  end

  def edit
    @store = Store.find(params[:store_id])
    @working_hours = @store.working_hours
  end

  def update
    @store = Store.find(params[:store_id])
    @working_hours = @store.working_hours
    @working_hours.each do
      @working_hour.update(params[:working_hour])
      @working_hour.store = @store
  end

  def destroy
  end

  private

  def working_hour_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:working_hour).permit(:week_day, :start_time, :end_time)
  end

end
