class SitecitiesController < ApplicationController
  # GET /sitecities
  # GET /sitecities.json
  def index
    @sitecities = Sitecity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sitecities }
    end
  end

  # GET /sitecities/1
  # GET /sitecities/1.json
  def show
    @sitecity = Sitecity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sitecity }
    end
  end

  # GET /sitecities/new
  # GET /sitecities/new.json
  def new
    @sitecity = Sitecity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sitecity }
    end
  end

  # GET /sitecities/1/edit
  def edit
    @sitecity = Sitecity.find(params[:id])
  end

  # POST /sitecities
  # POST /sitecities.json
  def create
    @sitecity = Sitecity.new(params[:sitecity])

    respond_to do |format|
      if @sitecity.save
        format.html { redirect_to @sitecity, notice: 'Sitecity was successfully created.' }
        format.json { render json: @sitecity, status: :created, location: @sitecity }
      else
        format.html { render action: "new" }
        format.json { render json: @sitecity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sitecities/1
  # PUT /sitecities/1.json
  def update
    @sitecity = Sitecity.find(params[:id])

    respond_to do |format|
      if @sitecity.update_attributes(params[:sitecity])
        format.html { redirect_to @sitecity, notice: 'Sitecity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sitecity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sitecities/1
  # DELETE /sitecities/1.json
  def destroy
    @sitecity = Sitecity.find(params[:id])
    @sitecity.destroy

    respond_to do |format|
      format.html { redirect_to sitecities_url }
      format.json { head :no_content }
    end
  end
end
