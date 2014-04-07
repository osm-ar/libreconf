class SponsorsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]
  
  # GET /sponsors
  # GET /sponsors.json
  def index
    @sponsors = Sponsor.find(:all, :limit => 10,
                            :joins => "LEFT JOIN `sponsor_types` ON sponsor_types.id = sponsors.sponsor_type_id",
                            :select => "sponsors.*, sponsor_types.name as sponsor_type",
                            :order => "sponsor_types.id ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sponsors }
    end
  end

  # GET /sponsors/1
  # GET /sponsors/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sponsor }
    end
  end

  # GET /sponsors/new
  # GET /sponsors/new.json
  def new
    @sponsor = Sponsor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sponsor }
    end
  end

  # GET /sponsors/1/edit
  def edit

  end

  # POST /sponsors
  # POST /sponsors.json
  def create
    @sponsor = Sponsor.new(sponsor_params)

    respond_to do |format|
      if @sponsor.save
        format.html { redirect_to @sponsor, notice: 'Sponsor was successfully created.' }
        format.json { render json: @sponsor, status: :created, location: @sponsor }
      else
        format.html { render action: "new" }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sponsors/1
  # PUT /sponsors/1.json
  def update
    @sponsor = Sponsor.find(params[:id])

    respond_to do |format|
      if @sponsor.update_attributes(sponsor_params)
        format.html { redirect_to @sponsor, notice: 'Sponsor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsors/1
  # DELETE /sponsors/1.json
  def destroy
    @sponsor = Sponsor.find(params[:id])
    @sponsor.destroy

    respond_to do |format|
      format.html { redirect_to sponsors_url }
      format.json { head :no_content }
    end
  end

  private
    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

    def sponsor_params
      params.require(:sponsor).permit(:sponsor_type_id, :name, :description, :email, :website, :logo_url)
    end

end
