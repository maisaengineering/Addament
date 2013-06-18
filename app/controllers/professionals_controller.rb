class ProfessionalsController < ApplicationController
  # GET /professionals
  # GET /professionals.json
  layout false
  def index
    @professionals = Professional.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @professionals }
    end
  end

  # GET /professionals/1
  # GET /professionals/1.json
  def show
    @professional = Professional.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @professional }
    end
  end


  # GET /professionals/new
  # GET /professionals/new.json
  def new
    @profile = current_user.profile
    @professional = Professional.new

    if !params[:id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @professional }
    end
    else
      render :layout => false
      end
  end

  # GET /professionals/1/edit
  def edit
    @professional = Professional.find(params[:id])
  end

  # POST /professionals
  # POST /professionals.json
  def create
    @professional = Professional.new(params[:professional])

    respond_to do |format|
       if @professional.save
        format.html{redirect_to  edit_profile_path(current_user.profile.id), notice: 'Professional Industry was successfully.'}
        format.js
      else
        format.html{render action: "new"}
        format.js
      end
    end  
    
  end

  # PUT /professionals/1
  # PUT /professionals/1.json
  def update
    @professional = Professional.find(params[:id])

    respond_to do |format|
      if @professional.update_attributes(params[:professional])
        format.html { redirect_to @professional, notice: 'Professional was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @professional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professionals/1
  # DELETE /professionals/1.json
  def destroy
    @professional = Professional.find(params[:id])
    @professional.destroy

    respond_to do |format|
      format.html { redirect_to professionals_url }
      format.json { head :no_content }
    end
  end

  end
