class Admin::PlansController < ApplicationController

  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    result = CreateStripePlan.call(plan_params)
    if result.success?
      redirect_to admin_plans_path
    else
      render :new
    end
  end

  def destroy
    @plan.destroy
    redirect_to admin_plans_path, notice: "Plan was deleted"
  end

  private
    def plan_params
      params.require(:plan).permit(:product, :interval, :amount)
    end
end
