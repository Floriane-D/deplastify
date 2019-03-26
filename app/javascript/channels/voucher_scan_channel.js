import consumer from "./consumer"

if (/scanqr/.test(window.location.href)) {
  consumer.subscriptions.create({channel: "VoucherScanChannel", id: params[:id]}, {
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
    swal(data.message, {
      icon: 'success'
    });
  };
};
