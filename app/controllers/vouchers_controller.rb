class VouchersController < ApplicationController
  require 'rqrcode'

  def index
    @vouchers = policy_scope(Voucher)
  end

  def create
    @voucher = Voucher.new()

    @benefit = Benefit.find(params[:benefit_id])
    @voucher.benefit = @benefit

    @voucher.user = current_user
    @voucher.status = "Not used"

    @voucher.key_qrcode = SecureRandom.hex(6).upcase
    authorize @voucher

    if @voucher.save
      redirect_to profile_path
      flash[:notice] = "Congratulations #{@voucher.user.first_name} 🎉, Please, present this voucher at #{@voucher.benefit.store.name}"
    else
      flash[:alert] = "Something went wrong"
      redirect_to store_path(@benefit.store)
    end
  end

  def show
    @voucher = Voucher.find(params[:id])
    authorize @voucher
  end

  # def edit
  #   @voucher = Voucher.find(params[:id])
  #   authorize @voucher
  # end

  def update
    @voucher = Voucher.find(params[:id])
    authorize @voucher
  end
end
