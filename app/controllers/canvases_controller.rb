class CanvasesController < ApplicationController
  before_action :set_canvase, only: [:show, :edit, :update, :destroy]

  # GET /canvases
  def index
    Canvas.update_canvases
    @canvases = Canvas.all
  end

  # GET /canvases/1
  def show
  end

  # GET /canvases/new
  def new
    @canvase = Canvas.new
  end

  # GET /canvases/1/edit
  def edit
  end

  # POST /canvases
  def create
    @canvase = Canvas.new(canvase_params)

    if @canvase.save
      redirect_to @canvase, notice: 'Canvas was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /canvases/1
  def update
    if @canvase.update(canvase_params)
      redirect_to @canvase, notice: 'Canvas was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /canvases/1
  def destroy
    @canvase.destroy
    redirect_to canvases_url, notice: 'Canvas was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_canvase
      @canvase = Canvas.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def canvase_params
      params.require(:canvase).permit(:canvas_key, :canvas_title, :canvas_created, :canvas_updated)
    end
end
