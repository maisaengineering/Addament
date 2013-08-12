class OrganizationsProfessionalsController < ApplicationController
  # GET /organizations_professionals
  # GET /organizations_professionals.json
  def index
    @organizations_professionals = OrganizationsProfessional.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organizations_professionals }
    end
  end

  # GET /organizations_professionals/1
  # GET /organizations_professionals/1.json
  def show
    @organizations_professional = OrganizationsProfessional.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @organizations_professional }
    end
  end

  # GET /organizations_professionals/new
  # GET /organizations_professionals/new.json
  def new
    @organizations_professional = OrganizationsProfessional.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organizations_professional }
    end
  end

  # GET /organizations_professionals/1/edit
  def edit
    @organizations_professional = OrganizationsProfessional.find(params[:id])
  end

  # POST /organizations_professionals
  # POST /organizations_professionals.json
  def create
    @organizations_professional = OrganizationsProfessional.new(params[:organizations_professional])

    respond_to do |format|
      if @organizations_professional.save
        format.html { redirect_to @organizations_professional, notice: 'Organizations professional was successfully created.' }
        format.json { render json: @organizations_professional, status: :created, location: @organizations_professional }
      else
        format.html { render action: "new" }
        format.json { render json: @organizations_professional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /organizations_professionals/1
  # PUT /organizations_professionals/1.json
  def update
    @organizations_professional = OrganizationsProfessional.find(params[:id])

    respond_to do |format|
      if @organizations_professional.update_attributes(params[:organizations_professional])
        format.html { redirect_to @organizations_professional, notice: 'Organizations professional was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @organizations_professional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations_professionals/1
  # DELETE /organizations_professionals/1.json
  def destroy
    @organizations_professional = OrganizationsProfessional.find(params[:id])
    @organizations_professional.destroy

    respond_to do |format|
      format.html { redirect_to organizations_professionals_url }
      format.json { head :no_content }
    end
  end
end
