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

    # @voucher.key_qrcode = SecureRandom.uuid
    @voucher.key_qrcode = "https://internationalbarcodes.com/"

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

  def destroy
    url = 'https://1435f2ca.ngrok.io/?https://s1.qwant.com/thumbr/0x380/2/f/2b7517996af62b91531b6cd5a1fbcef0fa2cefd9df5cc50fbbc002fb3cc005/QR%20code%20example.jpg?u=https%3A%2F%2Finternationalbarcodes.net%2Fwp-content%2Fuploads%2F2017%2F04%2FQR%2520code%2520example.jpg&q=0&b=1&p=0&a=1'
    @voucher = Voucher.find(params[:id])
    # @benefit = Benefit.find(params[:benefit_id])
    authorize @voucher

    if open(url).read == @voucher.key_qrcode
      flash[:notice] = "Congratulations, the voucher of #{@voucher.user.name} is valid 🎉"
      @voucher.destroy
      redirect_to profile_path
    else
      flash[:alert] = "Unfortunately, the voucher of #{@voucher.user.name} is not valid"
      redirect_to profile_path
    end
  end
end
