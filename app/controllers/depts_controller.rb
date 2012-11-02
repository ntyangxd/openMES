class DeptsController < ApplicationController
  def index
    @depts = Dept.paginate(:page => params[:page]).order('id DESC')
  end

  def new
    @dept = Dept.new
  end

  def create
    @dept = Dept.new(params[:dept])

    @dept.save
    redirect_to depts_path
  end

  def edit
    @dept = Dept.find(params[:id])
  end

  def update
    @dept = Dept.find(params[:id])
    if @dept.update_attributes(params[:dept])
      redirect_to depts_path
    else
      render 'edit'
    end
  end

  def show
    @dept = Dept.find(params[:id])
  end

  def destroy
    @dept = Dept.find(params[:id])
    @dept.destroy

    redirect_to depts_path
  end
end
