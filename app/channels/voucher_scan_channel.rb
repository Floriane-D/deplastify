class VoucherScanChannel < ApplicationCable::Channel
  # Called when the consumer has successfully
  # become a subscriber to this channel.
  def subscribed
    # raise
    voucher = Voucher.find(params[:id])
    stream_for voucher
  end
end
