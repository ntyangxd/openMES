#  ^_^  coding:utf-8

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:code], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path, :notice => "logged in!"
    else
      flash.now.alert = "不正确的用户名或密码"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
