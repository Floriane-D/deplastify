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

    @voucher.key_qrcode = SecureRandom.uuid

    authorize @voucher

    if @voucher.save
      redirect_to profile_path
      flash[:notice] = "Congratulations #{@voucher.user.name} 🎉, your voucher with #{@voucher.benefit.store.name} has been prepared"
    else
      flash[:alert] = "Something went wrong"
      redirect_to store_path(@benefit.store)
    end
  end

  def show
    @voucher = Voucher.find(params[:id])
  end
end
