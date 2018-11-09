class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @all_doses_for_a_cocktail = @cocktail.doses
    # raise
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params) # should replace with .new(restaurant_params) to use the sanitised params, instead of the dirty one
    return redirect_to cocktail_path(@cocktail) if @cocktail.save
    render :new
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo) # this is called strong params, for security
  end

end
