class ChinaAdventuresController < ApplicationController
  # GET /china_adventures
  # GET /china_adventures.json
  def index
    @china_adventures = ChinaAdventure.order("date asc").page(params[:page]).per(7)
  end
end