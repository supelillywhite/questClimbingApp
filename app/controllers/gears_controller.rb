class GearsController < ApplicationController
  before_action :set_gear, only: [:show, :edit, :update, :destroy]

  # GET /gears
  # GET /gears.json
  def index
    if user_signed_in?
      @gears = current_user.gears
      @categories = current_user.categories
    else
      redirect_to(root_path,
        notice: "Sorry, you must log in to create Gear")
    end
  end

  # GET /gears/1
  # GET /gears/1.json
  def show
    @gear = Gear.find(params[:id])
    if session[:user_id] != @gear.user_id
      redirect_to(gears_path,
        notice: "Sorry, you can't view this Gear Closet")
    end
  end

  # GET /gears/new
  def new
    @gear = Gear.new
  end

  # GET /gears/1/edit
  def edit
  end

  # POST /gears
  # POST /gears.json
  def create
    @gear = Gear.new(gear_params)
    @gear.user_id = current_user.id

    respond_to do |format|
      if @gear.save
        format.html { redirect_to @gear, notice: 'Gear was successfully created.' }
        format.json { render :show, status: :created, location: @gear }
      else
        format.html { render :new }
        format.json { render json: @gear.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gears/1
  # PATCH/PUT /gears/1.json
  def update
    respond_to do |format|
      if @gear.update(gear_params)
        format.html { redirect_to @gear, notice: 'Gear was successfully updated.' }
        format.json { render :show, status: :ok, location: @gear }
      else
        format.html { render :edit }
        format.json { render json: @gear.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gears/1
  # DELETE /gears/1.json
  def destroy
    @gear.destroy
    respond_to do |format|
      format.html { redirect_to gears_url, notice: 'Gear was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gear
      @gear = Gear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gear_params
      params.require(:gear).permit(:title, :description, :picture, :user_id, :date_purchased, category_ids:[], gear_attributes:[:category])
    end
end
