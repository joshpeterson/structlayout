# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @initial_code = params[:code] if params[:code].present?
    @initial_args = params[:args] if params[:args].present?
    type = params[:type] if params[:type].present?
    @c_is_enabled = type == 'c'
    @cpp_is_enabled = !@c_is_enabled
  end
end
