class CategoriesController < ApplicationController
  helper_method :bootstrap_icon_options
  def index
    @categories = current_user.categories.includes(:payments)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def bootstrap_icon_options
    [
      ['Select an Icon', ''],
      ['Book', 'bi bi-book'],
      ['Food', 'bi bi-cup-straw'],
      ['Drink', 'bi bi-beer'],
      ['Rent', 'bi bi-house-fill'],
      ['Car', 'bi bi-car'],
      ['Gas', 'bi bi-fuel-pump'],
      ['Electricity', 'bi bi-lightbulb-fill'],
      ['Water', 'bi bi-droplet-fill'],
      ['Phone', 'bi bi-phone'],
      ['Internet', 'bi bi-wifi'],
      ['Clothes', 'bi bi-tshirt'],
      ['Online Shopping', 'bi bi-cart'],
      ['Health', 'bi bi-heart-fill'],
      ['Gym', 'bi bi-person-arms-up'],
      ['Travel', 'bi bi-geo-alt-fill'],
      ['Education', 'bi bi-book-half']
    ]
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
