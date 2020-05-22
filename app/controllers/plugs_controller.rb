class PlugsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    filter = {}
    filter[:ac_dc]=params[:courant] if params[:courant].present?
    filter[:type_plug]=params[:type] if params[:type].present?
    power_max = params[:power_max] || 500 
    price_max = params[:price_max] || 500
    if params[:search].present? && params[:search][:query] != ''
      @plugs = policy_scope(Plug.geocoded.near(params[:search][:query])).where(filter).where('price <= ?', price_max).where('power <= ?', power_max)
    else
      @plugs = policy_scope(Plug.geocoded.where(filter).where('price <= ?', price_max).where('power <= ?', power_max))
    end

    @markers = @plugs.map do |plug|
      {
        lat: plug.latitude,
        lng: plug.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { plug: plug })
      }
    end
  end
  
  def show
    @plug = Plug.find(params[:id])
    authorize @plug
    @booking = Booking.new
    authorize @booking
  end
  
  def new
    @plug = Plug.new
    authorize @plug
  end

  def create
    @plug = Plug.new(plug_params)
    @plug.user = current_user
    authorize @plug

    if @plug.save
      redirect_to plug_path(@plug)
    else
      render :new
    end
  end

  def update
    @plug = Plug.find(params[:id])
    authorize @plug
    @plug.update(plug_params)
    redirect_to plug_path(@plug)
  end

  def edit
    @plug = Plug.find(params[:id])
    authorize @plug
  end

  def destroy
    @plug = Plug.find(params[:id])
    authorize @plug
    @plug.destroy
    redirect_to plugs_path
  end
    
  private

  def plug_params
    params.require(:plug).permit(:address, :price, :power, :ac_dc, :type_plug, photos: [])
  end

end
