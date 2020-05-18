class PlugsController < ApplicationController
  def index
    @plugs = Plug.all
  end
 
  def new
    @plug = Plug.new
  end
 
  def create
    @plug = Plug.new(plug_params)
    @plug.save
  end
 
  def show
    @plug = Plug.find(params[:id])
  end
 
  private
 
  def plug_params
    params.require(:plug).permit(:address, :power, :ad_dc, :type_plug, :price)
  end
end
