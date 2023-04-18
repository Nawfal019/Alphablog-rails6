class CategoriesController < ApplicationController
  before_action :require_admin, except: [:show, :index]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Successfully created Categories"
      redirect_to @category
    else
      render 'new'
    end
  end

  def index
    @categories= Category.paginate(page: params[:page], per_page: 4)
  end

  def show
    @category = Category.find(params[:id])
  end
end

private

def category_params
  params.require(:category).permit(:name)
end

def require_admin
  if !(logged_in? && current_user.admin?)
    flash[:alert] = "this action can be performed by admins."
    redirect_to categories_path
  end
end
