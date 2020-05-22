class BookingsController < ApplicationController
  def new
    @plug = Plug.find(params[:plug_id])
    authorize @plug
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params.merge(user:current_user))
    # @booking.user = current_user
    authorize @booking
    @booking.plug = Plug.find(params[:plug_id])
    # @plug = Plug.find(params[:plug_id])
    # authorize @plug
    @booking.transaction_price = price_calculation(@booking)
    if @booking.save!
      flash[:notice] = "Booking successfully created"
      redirect_to plug_path(@booking.plug)
    else
      render :new
    end
  end

  private

  def price_calculation(object)
    (object.end_time - object.start_time) / 3600 * Plug.find(params[:plug_id]).price
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
