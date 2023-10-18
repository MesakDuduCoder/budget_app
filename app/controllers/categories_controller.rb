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
      ["Select an Icon", ""],        
      ["Book", "bi bi-book"],
      ["Movie", "bi bi-film"],
      ["Music", "bi bi-music-note"],
      ["Game", "bi bi-joystick"],
      ["Food", "bi bi-cup-straw"],
      ["Drink", "bi bi-beer"],
      ["Rent", "bi bi-building"],
      ["Car", "bi bi-car"],
      ["Gas", "bi bi-lightning-charge-fill"],
      ["Electricity", "bi bi-lightning-charge-fill"],
      ["Water", "bi bi-droplet-fill"],
      ["Phone", "bi bi-phone"],
      ["Internet", "bi bi-wifi"],
      ["Clothes", "bi bi-tshirt"],
      ["Online Shopping", "bi bi-cart"],
      ["Health", "bi bi-heart-fill"],
      ["Gym", "bi bi-droplet-fill"],
      ["Travel", "bi bi-geo-alt-fill"],
      ["Education", "bi bi-book-half"],
    ]
  end

    private


    def category_params
        params.require(:category).permit(:name, :icon)
    end
end
