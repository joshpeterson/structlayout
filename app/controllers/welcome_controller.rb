# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @initial_code = params[:code] if params[:code].present?
  end
end
