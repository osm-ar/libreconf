class SponsorTypesController < ApplicationController
  before_filter :authenticate_user!
  
  def sponsor_params
    params.require(:sponsor_type).permit(:name, :commit, :authenticity_token)
  end

  # GET /sponsor_types
  # GET /sponsor_types.json
  def index
    @sponsor_types = SponsorType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sponsor_types }
    end
  end

  # GET /sponsor_types/1
  # GET /sponsor_types/1.json
  def show
    @sponsor_type = SponsorType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sponsor_type }
    end
  end

  # GET /sponsor_types/new
  # GET /sponsor_types/new.json
  def new
    @sponsor_type = SponsorType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sponsor_type }
    end
  end

  # GET /sponsor_types/1/edit
  def edit
    @sponsor_type = SponsorType.find(params[:id])
  end

  # POST /sponsor_types
  # POST /sponsor_types.json
  def create
    @sponsor_type = SponsorType.new(sponsor_params)

    respond_to do |format|
      if @sponsor_type.save
        format.html { redirect_to @sponsor_type, notice: 'Sponsor type was successfully created.' }
        format.json { render json: @sponsor_type, status: :created, location: @sponsor_type }
      else
        format.html { render action: "new" }
        format.json { render json: @sponsor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sponsor_types/1
  # PUT /sponsor_types/1.json
  def update
    @sponsor_type = SponsorType.find(params[:id])

    respond_to do |format|
      if @sponsor_type.update_attributes(params[:sponsor_type])
        format.html { redirect_to @sponsor_type, notice: 'Sponsor type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sponsor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsor_types/1
  # DELETE /sponsor_types/1.json
  def destroy
    @sponsor_type = SponsorType.find(params[:id])
    @sponsor_type.destroy

    respond_to do |format|
      format.html { redirect_to sponsor_types_url }
      format.json { head :no_content }
    end
  end
end
