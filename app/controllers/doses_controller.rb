class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @all_ingredients = Ingredient.all # you can present the user with the ingredients and their id
  end

  def create
    raise # this allows us to see what the dose form sends in the params when submitted
    @dose = Dose.new(dose_params) # should replace with .new(restaurant_params) to use the sanitised params, instead of the dirty one
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail # here we are specifying the restaurant_id, this is equivalent to writing @review.restaurant_id = @restaurant.id
    # @dose.ingredient_id = ingredient_id_params[:ingredient_id].to_i
    return redirect_to cocktail_path(@cocktail) if @dose.save
    @all_ingredients = Ingredient.all
    render :new # this goes to the new.html.erb in the doses folder, which requires @all_ingredients
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id) # this is called strong params, for security
  end

  # def ingredient_id_params
  #   params.require(:dose).permit(:ingredient_id) # this is called strong params, for security
  # end

end
