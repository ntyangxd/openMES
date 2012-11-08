# coding:utf-8

class UsersController < ApplicationController

  def index
    @users = User.paginate(:page => params[:page]).order('id DESC')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path, :notice => '创建用户成功'
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destory

    redirect_to users_path
  end
end
