class HardwareTypesController < ApplicationController
  def new
    @hardware_type = HardwareType.new
  end
  
  def create
    @hardware_type = HardwareType.new(params[:hardware_type])
    if @hardware_type.save
      flash[:notice] = "New hardware type created successfully"
      redirect_to hardwares_url
    else
      flash[:notice] = "Could not Create Hardware Type"
    end
end