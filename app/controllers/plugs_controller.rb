class PlugsController < ApplicationController

  def index
    @plugs = policy_scope(Plug).order(created_at: :desc)
  end
  
  def show
    @plug = Plug.find(params[:id])
  end
  
  def new
    @plug = Plug.new
    authorize @plug
  end

  def create
    @plug = Plug.new(require_params)
    authorize @plug

    if @plug.save
      redirect_to plugs_path
    else
      render :new
    end
  end
  
  private

  def require_params
    params.require(:plug).permit(:address, :price, :power, :ac_dc, :type_plug, photos: [])
  end

end
