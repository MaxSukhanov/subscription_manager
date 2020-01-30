require 'create_plan.rb'
class PlansController < ApplicationController
  def new
    @plan = Plan.new
  end
  
  def create
    p plan_params
    result = CreateStripePlan.call(
        plan_params
      )
    if result.success?
      redirect_to products_path
    else
      render action: 'new'
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:interval)
  end
end
