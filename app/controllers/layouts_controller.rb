class LayoutsController < ApplicationController
  def create
    input = params[:layout]['code']
    type = params[:layout]['type']
    result = ValidateInput.call(input)
    if !result.success
      render plain: result.message
    else
      @output = ComputeLayout.call(input, type)
      render :show
    end
  end
end
