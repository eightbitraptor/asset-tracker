class SoftwaresController < ApplicationController
  def index
    @softwares = Software.find(:all)
  end

  def new
    @software = Software.new
  end

  def edit
    @software = Software.find(params[:id])
  end

  def create
    @software = Software.new(params[:software])
    if @software.save
      flash[:notice] = 'Software was successfully created.'
      redirect_to softwares_path
    else
      render :action => "new"
    end
  end

  def update
    @software = Software.find(params[:id])
    if @software.update_attributes(params[:software])
      flash[:notice] = 'Software was successfully updated.'
      redirect_to softwares_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @software = Software.find(params[:id])
    @software.destroy
    redirect_to softwares_url
  end
  
  def assign
  end
end
