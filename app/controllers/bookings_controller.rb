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
    raise
    if @booking.save!
      redirect_to plug_path(@booking.plug)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:plug_id, :user_id, :transaction_price, :start_time, :end_time)
  end
end
