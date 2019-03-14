class VouchersController < ApplicationController
  require 'rqrcode'

  def index
    @vouchers = current_user.vouchers
  end

  def create
    @voucher = Voucher.new()
    @store = Store.find(params[:store_id])
    @voucher.store = @store

    @qrcode = RQRCode::QRCode.new(SecureRandom.uuid, :size => 4, :level => :h )
    @voucher.qrcode = @qrcode

    @voucher.status = "Not used"

    @voucher.user = current_user

    if @voucher.save
      redirect_to store_path(@store)
      # flash[:notice] = "Congratulations! 🎉 Your voucher with #{@voucher.store.name} has been prepared"
    else
      render :new
    end
  end

  def show
    @voucher = Voucher.find(params[:id])
  end

  private

  # def voucher_params
  #   params.require(:voucher).permit(:start_date, :end_date, :price)
  # end

end
