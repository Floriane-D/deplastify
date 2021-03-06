class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy, :scanqr, :checkqr]
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @stores = policy_scope(Store)
  end

  def show
    @user = current_user
  end

  def new
    @store = Store.new
    authorize @store
  end

  def create
    @store = Store.new(store_params)
    @store.user = current_user
    authorize @store
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

  def scanqr
  end

  def checkqr
     # binding.pry
    decoded = params[:decoded_qr]
    qr_not_found = true

    @store.vouchers.each do |voucher|
      if decoded == voucher.key_qrcode

        # ActionCable.server.broadcast 'VoucherScanChannel', message: "Your voucher has been validated"
        VoucherScanChannel.broadcast_to(
          voucher,
          message: "You can enjoy #{voucher.benefit.description} at #{voucher.benefit.store.name} now!",
          status: 'success'
        )

        voucher.update(status: "Used")
        qr_not_found = false
        render js: "window.location = #{store_path(@store).to_json}"
        flash[:notice] = "Congratulations, the voucher of #{voucher.user.first_name} is valid 🎉"
      end
    end
    if qr_not_found
      render js: "window.location = #{store_path(@store).to_json}"
      # store_path(@store)
      flash[:alert] = "Unfortunately, this voucher is not valid"
    end
  end

  def destroy
    @store.destroy
    redirect_to profile_path
  end

  private

  def set_store
    @store = Store.find(params[:id])
    authorize @store
  end

  def store_params
    params.require(:store).permit(:name, :address, :description, :phone, :picture)
  end
end
