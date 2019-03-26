import swal from 'sweetalert';
import consumer from "../channels/consumer";
console.log('Voucher Pack')

const vouchers = document.querySelectorAll('.voucher-card');
window.swal = swal;

const subcribeToVoucherScan = (voucher) => {
  consumer.subscriptions.create({
    channel: "VoucherScanChannel",
    id: voucher.dataset.id
  }, {
  // Called once when the subscription is created.
  initialized() {
    console.log('initialized');
  },

  // Called when the subscription is ready for use on the server.
  connected() {
    console.log('connected');
  },

  // Called when the WebSocket connection is closed.
  disconnected() {
    console.log('disconnected');
  },

  // Receveid scan
  received(data) {
    console.log('Scanned');

    const options = {
      text: data.message,
      icon: 'success',
      title: '🎉 Done!',
      button: {
        text: "Great!",
      },
      closeOnClickOutside: true
    }

    const callback = (isConfirm) => {
      if (isConfirm) {
        window.location.reload(true);
      }
    }

    swal(options).then(callback)
  }
});
}

vouchers.forEach((voucher) => { subcribeToVoucherScan(voucher) });

