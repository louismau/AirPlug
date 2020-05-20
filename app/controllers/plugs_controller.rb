class PlugsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @plugs = policy_scope(Plug).order(created_at: :desc)
  end
  
  def show
    @plug = Plug.find(params[:id])
    authorize @plug
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
      redirect_to plugs_path
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
