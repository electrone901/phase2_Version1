class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy, :visits]
  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.all
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
  end
   

  def set_cors_headers
   headers["Access-Control-Allow-Origin"] = "*"
   headers["Access-Control-Allow-Methods"] = "POST, GET, OPTIONS, PUT"
   headers["Access-Control-Allow-Headers"] = "Content-Type, Origin, Referer, User-Agent"
   headers["Access-Control-Max-Age"] = "3600"
  end

  def visits_preflight
    set_cors_headers
    render :text => "", :content_type => "text/plain"
  end 
   def visits
    set_cors_headers
    respond_to do |format|
       register a new visit to the site
      if @site.register_visit(params[:pathname], params[:duration]) # if it was successful.
        format.html { redirect_to @site, notice: 'Site visit was successfully registered.' }
        format.json { render :show, status: :ok, location: @site }
      else # otherwise,
        format.html { render :edit } # if it fails, send the user to the edit form.
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end



  # GET /sites/new
  def new
    @site = Site.new
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(site_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: 'Site was successfully created.' }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
        format.json { render :show, status: :ok, location: @site }
      else
        format.html { render :edit }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url, notice: 'Site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:url)
    end
end
