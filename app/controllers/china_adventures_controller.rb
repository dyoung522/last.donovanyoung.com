class ChinaAdventuresController < ApplicationController
  # GET /china_adventures
  # GET /china_adventures.json
  def index
    params.permit( :content, :date, :title )
    @china_adventures = ChinaAdventure.page(params[:page]).per(7)
  end
end