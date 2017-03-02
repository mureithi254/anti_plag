class PlagsController < ApplicationController
  before_action :set_plag, only: [:show, :edit, :update, :destroy]

  # GET /plags
  # GET /plags.json
  def index
    @plags = Plag.all
  end

  # GET /plags/1
  # GET /plags/1.json
  def show
  end

  # GET /plags/new
  def new
    @plag = Plag.new
  end

  # GET /plags/1/edit
  def edit
  end

  # POST /plags
  # POST /plags.json
  def create
    @plag = Plag.new(plag_params)

    respond_to do |format|
      if @plag.save
        format.html { redirect_to @plag, notice: 'Plag was successfully created.' }
        format.json { render :show, status: :created, location: @plag }
      else
        format.html { render :new }
        format.json { render json: @plag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plags/1
  # PATCH/PUT /plags/1.json
  def update
    respond_to do |format|
      if @plag.update(plag_params)
        format.html { redirect_to @plag, notice: 'Plag was successfully updated.' }
        format.json { render :show, status: :ok, location: @plag }
      else
        format.html { render :edit }
        format.json { render json: @plag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plags/1
  # DELETE /plags/1.json
  def destroy
    @plag.destroy
    respond_to do |format|
      format.html { redirect_to plags_url, notice: 'Plag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_plag
    @plag = Plag.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def plag_params
    params.fetch(:plag, {})
  end
end
