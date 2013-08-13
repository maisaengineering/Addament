class OrgrequestsController < ApplicationController
  # GET /orgrequests
  # GET /orgrequests.json
  def index
    @orgrequests = Orgrequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orgrequests }
    end
  end

  # GET /orgrequests/1
  # GET /orgrequests/1.json
  def show
    @orgrequest = Orgrequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @orgrequest }
    end
  end

  # GET /orgrequests/new
  # GET /orgrequests/new.json
  def new
    @orgrequest = Orgrequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @orgrequest }
    end
  end

  # GET /orgrequests/1/edit
  def edit
    @orgrequest = Orgrequest.find(params[:id])
  end

  # POST /orgrequests
  # POST /orgrequests.json
  def create
    @orgrequest = Orgrequest.new(params[:orgrequest])

    respond_to do |format|
      if @orgrequest.save
        format.html { redirect_to @orgrequest, notice: 'Orgrequest was successfully created.' }
        format.json { render json: @orgrequest, status: :created, location: @orgrequest }
      else
        format.html { render action: "new" }
        format.json { render json: @orgrequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orgrequests/1
  # PUT /orgrequests/1.json
  def update
    @orgrequest = Orgrequest.find(params[:id])

    respond_to do |format|
      if @orgrequest.update_attributes(params[:orgrequest])
        format.html { redirect_to @orgrequest, notice: 'Orgrequest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @orgrequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orgrequests/1
  # DELETE /orgrequests/1.json
  def destroy
    @orgrequest = Orgrequest.find(params[:id])
    @orgrequest.destroy

    respond_to do |format|
      format.html { redirect_to orgrequests_url }
      format.json { head :no_content }
    end
  end
end
