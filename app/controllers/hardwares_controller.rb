class HardwaresController < ApplicationController

  def index
    @hardwares = Hardware.find(:all)
    @available_software = Software.find(:all, :conditions => {:hardware_id => nil})
  end

  def new
    @hardware = Hardware.new
  end

  def edit
    @hardware = Hardware.find(params[:id])
  end

  def create
    @hardware = Hardware.new(params[:hardware])
    if @hardware.save
      flash[:notice] = 'Hardware was successfully created.'
      redirect_to hardwares_path
    else
      render :action => "new"
    end
  end

  def update
    @hardware = Hardware.find(params[:id])
    if @hardware.update_attributes(params[:hardware])
      flash[:notice] = 'Hardware was successfully updated.'
      redirect_to hardwares_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @hardware = Hardware.find(params[:id])
    @hardware.destroy
    redirect_to hardwares_path
  end
end
