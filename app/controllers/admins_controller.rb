class AdminsController < ApplicationController

  def index
    Requester.is_admin(session[:cas_user])
    @user_id = session[:cas_user]
    @admins  = Admin.all
  end

  def new
    Requester.is_admin(session[:cas_user])
    @info = Admin.new
  end

  def edit
    Requester.is_admin(session[:cas_user])
    @info = Admin.find(params[:id])
  end

  def create
    @info = Admin.new(params[:admin])
    if @info.save
      redirect_to admins_path
    else
      render action: 'new'
    end
  end

  def update
    @info = Admin.find(params[:id])
    if @info.update_attributes(params[:admin])
      redirect_to admins_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @info = Admin.find(params[:id])
    @info.destroy
    redirect_to admins_path
  end

end



