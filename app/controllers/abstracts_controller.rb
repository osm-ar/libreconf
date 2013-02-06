class AbstractsController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create]
  
  # GET /abstracts
  # GET /abstracts.json
  def index
    if params.has_key?(:abstract_status_id)
      @abstracts = Abstract.where(:abstract_status_id => params[:abstract_status_id])
    else
      @abstracts = Abstract.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @abstracts }
    end
  end

  # GET /abstracts/1
  # GET /abstracts/1.json
  def show
    @abstract = Abstract.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @abstract }
    end
  end

  # GET /abstracts/new
  # GET /abstracts/new.json
  def new
    @abstract = Abstract.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @abstract }
    end
  end

  # GET /abstracts/1/edit
  def edit
    @abstract = Abstract.find(params[:id])
  end

  # POST /abstracts
  # POST /abstracts.json
  def create
    @abstract = Abstract.new(params[:abstract])

    respond_to do |format|
      if (user_signed_in? or verify_recaptcha) and @abstract.save
        if user_signed_in?
          format.html { redirect_to @abstract, notice: t(:abstract_created) }
        else
          format.html { redirect_to root_path, notice: t(:abstract_created) }
        end
        # format.json { render json: @abstract, status: :created, location: @abstract }
      else
        format.html { render action: "new" }
        #format.json { render json: @abstract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /abstracts/1
  # PUT /abstracts/1.json
  def update
    @abstract = Abstract.find(params[:id])

    respond_to do |format|
      if @abstract.update_attributes(params[:abstract])
        format.html { redirect_to @abstract, notice: 'Abstract was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @abstract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abstracts/1
  # DELETE /abstracts/1.json
  def destroy
    @abstract = Abstract.find(params[:id])
    @abstract.destroy

    respond_to do |format|
      format.html { redirect_to abstracts_url, notice: 'Abstract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
