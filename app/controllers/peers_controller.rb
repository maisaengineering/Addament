class PeersController < ApplicationController
  # GET /peers
  # GET /peers.json
  def index
    @peers = Peer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @peers }
    end
  end

  # GET /peers/1
  # GET /peers/1.json
  def show
    @peer = Peer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @peer }
    end
  end

  # GET /peers/new
  # GET /peers/new.json
  def new
    @peer = Peer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @peer }
    end
  end

  # GET /peers/1/edit
  def edit
    @peer = Peer.find(params[:id])
  end

  # POST /peers
  # POST /peers.json
  def create
    @peer = Peer.new(params[:peer])

    respond_to do |format|
      if @peer.save
        format.html { redirect_to @peer, notice: 'Peer was successfully created.' }
        format.json { render json: @peer, status: :created, location: @peer }
      else
        format.html { render action: "new" }
        format.json { render json: @peer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /peers/1
  # PUT /peers/1.json
  def update
    @peer = Peer.find(params[:id])

    respond_to do |format|
      if @peer.update_attributes(params[:peer])
        format.html { redirect_to @peer, notice: 'Peer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @peer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peers/1
  # DELETE /peers/1.json
  def destroy
    @peer = Peer.find(params[:id])
    @peer.destroy

    respond_to do |format|
      format.html { redirect_to peers_url }
      format.json { head :no_content }
    end
  end
end
