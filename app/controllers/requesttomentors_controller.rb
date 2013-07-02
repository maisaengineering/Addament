class RequesttomentorsController < ApplicationController
  # GET /requesttomentors
  # GET /requesttomentors.json
  def index
    @requesttomentors = Requesttomentor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requesttomentors }
    end
  end

  # GET /requesttomentors/1
  # GET /requesttomentors/1.json
  def show
    @requesttomentor = Requesttomentor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @requesttomentor }
    end
  end

  # GET /requesttomentors/new
  # GET /requesttomentors/new.json
  def new
    @requesttomentor = Requesttomentor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @requesttomentor }
    end
  end

  # GET /requesttomentors/1/edit
  def edit
    @requesttomentor = Requesttomentor.find(params[:id])
  end

  # POST /requesttomentors
  # POST /requesttomentors.json
  def create
    @requesttomentor = Requesttomentor.new(params[:requesttomentor])

    respond_to do |format|
      if @requesttomentor.save
        format.html { redirect_to @requesttomentor, notice: 'Requesttomentor was successfully created.' }
        format.json { render json: @requesttomentor, status: :created, location: @requesttomentor }
      else
        format.html { render action: "new" }
        format.json { render json: @requesttomentor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requesttomentors/1
  # PUT /requesttomentors/1.json
  def update
    @requesttomentor = Requesttomentor.find(params[:id])

    respond_to do |format|
      if @requesttomentor.update_attributes(params[:requesttomentor])
        format.html { redirect_to @requesttomentor, notice: 'Requesttomentor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @requesttomentor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requesttomentors/1
  # DELETE /requesttomentors/1.json
  def destroy
    @requesttomentor = Requesttomentor.find(params[:id])
    @requesttomentor.destroy

    respond_to do |format|
      format.html { redirect_to requesttomentors_url }
      format.json { head :no_content }
    end
  end
end
