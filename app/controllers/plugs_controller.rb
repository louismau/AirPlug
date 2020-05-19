class PlugsController < ApplicationController
  
  def index
    @plugs = Plug.all
  end
  
  def show
    @plug = Plug.find(params[:id])
  end
  
  def new
    @plug = Plug.new
  end

  def create
    @plug = Plug.new(require_params)

    if @plug.save
      redirect_to #
    else
      render :new
    end
  end
  
  private

  def require_params
    params.require(:plug).permit(:address, :price, :power, :ac_dc, :type_plug, photos: [])
  end

end
