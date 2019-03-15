class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @stores = Store.where.not(latitude: nil, longitude: nil)

    @markers = @stores.map do |store|
      {
        lat: store.latitude,
        lng: store.longitude,
        infoWindow: render_to_string(partial: "store-card", locals: { store: store })
      }
    end
  end

  def profile
    @user = current_user
    @stores = @user.stores
    @vouchers = @user.vouchers
  end
end
