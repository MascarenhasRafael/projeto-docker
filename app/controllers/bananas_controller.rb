class BananasController < ApplicationController
  before_action :set_banana, only: %i[ show edit update destroy ]

  # GET /bananas or /bananas.json
  def index
    @bananas = Banana.all
  end

  # GET /bananas/1 or /bananas/1.json
  def show
  end

  # GET /bananas/new
  def new
    @banana = Banana.new
  end

  # GET /bananas/1/edit
  def edit
  end

  # POST /bananas or /bananas.json
  def create
    @banana = Banana.new(banana_params)

    respond_to do |format|
      if @banana.save
        format.html { redirect_to banana_url(@banana), notice: "Banana was successfully created." }
        format.json { render :show, status: :created, location: @banana }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @banana.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bananas/1 or /bananas/1.json
  def update
    respond_to do |format|
      if @banana.update(banana_params)
        format.html { redirect_to banana_url(@banana), notice: "Banana was successfully updated." }
        format.json { render :show, status: :ok, location: @banana }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @banana.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bananas/1 or /bananas/1.json
  def destroy
    @banana.destroy

    respond_to do |format|
      format.html { redirect_to bananas_url, notice: "Banana was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banana
      @banana = Banana.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def banana_params
      params.require(:banana).permit(:name, :kind)
    end
end
