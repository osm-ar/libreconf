class AbstractStatusesController < ApplicationController
  # GET /abstract_statuses
  # GET /abstract_statuses.json
  def index
    @abstract_statuses = AbstractStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @abstract_statuses }
    end
  end

  # GET /abstract_statuses/1
  # GET /abstract_statuses/1.json
  def show
    @abstract_status = AbstractStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @abstract_status }
    end
  end

  # GET /abstract_statuses/new
  # GET /abstract_statuses/new.json
  def new
    @abstract_status = AbstractStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @abstract_status }
    end
  end

  # GET /abstract_statuses/1/edit
  def edit
    @abstract_status = AbstractStatus.find(params[:id])
  end

  # POST /abstract_statuses
  # POST /abstract_statuses.json
  def create
    @abstract_status = AbstractStatus.new(params[:abstract_status])

    respond_to do |format|
      if @abstract_status.save
        format.html { redirect_to @abstract_status, notice: 'Abstract status was successfully created.' }
        format.json { render json: @abstract_status, status: :created, location: @abstract_status }
      else
        format.html { render action: "new" }
        format.json { render json: @abstract_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /abstract_statuses/1
  # PUT /abstract_statuses/1.json
  def update
    @abstract_status = AbstractStatus.find(params[:id])

    respond_to do |format|
      if @abstract_status.update_attributes(params[:abstract_status])
        format.html { redirect_to @abstract_status, notice: 'Abstract status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @abstract_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abstract_statuses/1
  # DELETE /abstract_statuses/1.json
  def destroy
    @abstract_status = AbstractStatus.find(params[:id])
    @abstract_status.destroy

    respond_to do |format|
      format.html { redirect_to abstract_statuses_url }
      format.json { head :no_content }
    end
  end
end
