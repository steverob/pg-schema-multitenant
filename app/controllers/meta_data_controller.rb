class MetaDataController < ApplicationController
  before_action :set_meta_datum, only: [:show, :edit, :update, :destroy]

  # GET /meta_data
  # GET /meta_data.json
  def index
    @meta_data = MetaDatum.all
  end

  # GET /meta_data/1
  # GET /meta_data/1.json
  def show
  end

  # GET /meta_data/new
  def new
    @meta_datum = MetaDatum.new
  end

  # GET /meta_data/1/edit
  def edit
  end

  # POST /meta_data
  # POST /meta_data.json
  def create
    @meta_datum = MetaDatum.new(meta_datum_params)

    respond_to do |format|
      if @meta_datum.save
        format.html { redirect_to @meta_datum, notice: 'Meta datum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @meta_datum }
      else
        format.html { render action: 'new' }
        format.json { render json: @meta_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meta_data/1
  # PATCH/PUT /meta_data/1.json
  def update
    respond_to do |format|
      if @meta_datum.update(meta_datum_params)
        format.html { redirect_to @meta_datum, notice: 'Meta datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @meta_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meta_data/1
  # DELETE /meta_data/1.json
  def destroy
    @meta_datum.destroy
    respond_to do |format|
      format.html { redirect_to meta_data_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meta_datum
      @meta_datum = MetaDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meta_datum_params
      params.require(:meta_datum).permit(:table_name, :field_name, :account_id, :human_name)
    end
end
