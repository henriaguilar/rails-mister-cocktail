class DosesController < ApplicationController
before_action :set_cocktail, except: :destroy

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def destroy
    @dose = Dose.find(params[:id])
    cocktail_id = @dose.cocktail_id
    @dose.destroy
    redirect_to cocktail_path(cocktail_id)
  end

  private
    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end

    def dose_params
      params.require(:dose).permit(:name, :cocktail_id, :ingredient_id)
    end
end
