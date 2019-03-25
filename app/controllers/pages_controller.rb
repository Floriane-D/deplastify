class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :results]

  def home
  end

  def profile
    @user = current_user
    @stores = @user.stores
    @vouchers = @user.vouchers
  end

  def results
  @stores = Store.where.not(latitude: nil, longitude: nil)

    if params[:search].present? == false
      search_address = "Rio de Janeiro, Brazil"
      search_distance = 5.01

      search_coordinates = Geocoder.search(search_address).first.coordinates

      stores_with_location_criteria = []

      @stores.each do |store|
        if store.distance_to(search_coordinates) < search_distance
          stores_with_location_criteria << store
        end
      end

    elsif params[:search].present? || params[:search].match?("^(\-?\d+(\.\d+)?),\s*(\-?\d+(\.\d+)?)$")

      search_address = params[:search][:address]

      search_distance = 5.01

      search_coordinates = Geocoder.search(search_address).first.coordinates

      stores_with_location_criteria = []

      @stores.each do |store|
        if store.distance_to(search_coordinates) < search_distance
          stores_with_location_criteria << store
        end
      end
    else
      search_address = params[:search][:address]

      search_distance = 5.01

      search_coordinates = search_address.split(' ')

      stores_with_location_criteria = []

      @stores.each do |store|
        if store.distance_to(search_coordinates) < search_distance
          stores_with_location_criteria << store
        end
      end
    end
    @stores = stores_with_location_criteria

    unless @stores.empty?
      @markers = @stores.map do |store|
        {
          lat: store.latitude,
          lng: store.longitude,
          infoWindow: render_to_string(partial: "store-card", locals: { store: store })
        }
      end
    else
      puts "hello"
    end
  end
end
