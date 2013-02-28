class AdminsController < ApplicationController

  def index
    @user_id = session[:cas_user]
    @admins = Admin.all
  end

  def new
  	@info = Admin.new
  end

  def edit
  	@info = Admin.find(params[:id])
  end

  def create
  	@info = Admin.new(params[:admin])
  	if @info.save
      Requester.is_admin(session[:cas_user])
  		redirect_to admins_path
  	else
  		render action:'new'
  	end

  end

  def update
  	@info = Admin.find(params[:id])
  	if @info.update_attributes(params[:admin])
  		redirect_to admins_path
  	else
  		render action:'edit'
  	end

  end

  def destroy
  	@info = Admin.find(params[:id])
  	@info.destroy
    Requester.is_admin(session[:cas_user])
    redirect_to admins_path
  end

end



