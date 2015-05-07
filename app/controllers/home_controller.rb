class HomeController < ApplicationController

  before_action :set_towns, only: [:index]

  def index
  end

  private

    def set_towns
      @towns = TOWNS
    end

end
