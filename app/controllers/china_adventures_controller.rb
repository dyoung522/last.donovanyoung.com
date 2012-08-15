class ChinaAdventuresController < ApplicationController
  # GET /china_adventures
  # GET /china_adventures.json
  def index
    @china_adventures = ChinaAdventure.order("date asc").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @china_adventures }
    end
  end
end