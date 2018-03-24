# frozen_string_literal: true

class LayoutsController < ApplicationController
  def create
    input = params[:layout]['code']
    type = params[:layout]['type']
    result = ValidateInput.call(input)
    if !result.success
      render plain: result.message
    else
      flags = params[:layout]['flags']
      @output = ComputeLayout.call(input, type, flags)
      render :show
    end
  end
end
