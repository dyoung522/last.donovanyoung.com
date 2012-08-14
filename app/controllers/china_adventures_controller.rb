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

  # GET /china_adventures/1
  # GET /china_adventures/1.json
  def show
    @china_adventure = ChinaAdventure.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @china_adventure }
    end
  end

  # GET /china_adventures/new
  # GET /china_adventures/new.json
  def new
    @china_adventure = ChinaAdventure.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @china_adventure }
    end
  end

  # GET /china_adventures/1/edit
  def edit
    @china_adventure = ChinaAdventure.find(params[:id])
  end

  # POST /china_adventures
  # POST /china_adventures.json
  def create
    @china_adventure = ChinaAdventure.new(params[:china_adventure])

    respond_to do |format|
      if @china_adventure.save
        format.html { redirect_to @china_adventure, notice: 'China adventure was successfully created.' }
        format.json { render json: @china_adventure, status: :created, location: @china_adventure }
      else
        format.html { render action: "new" }
        format.json { render json: @china_adventure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /china_adventures/1
  # PUT /china_adventures/1.json
  def update
    @china_adventure = ChinaAdventure.find(params[:id])

    respond_to do |format|
      if @china_adventure.update_attributes(params[:china_adventure])
        format.html { redirect_to @china_adventure, notice: 'China adventure was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @china_adventure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /china_adventures/1
  # DELETE /china_adventures/1.json
  def destroy
    @china_adventure = ChinaAdventure.find(params[:id])
    @china_adventure.destroy

    respond_to do |format|
      format.html { redirect_to china_adventures_url }
      format.json { head :no_content }
    end
  end
end
