class GearsController < ApplicationController
  before_action :set_gear, only: [:show, :edit, :update, :destroy]
  before_action :check_auth, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @gears = current_user.gears
      @categories = current_user.categories
    else
      redirect_to(root_path,
        notice: "Sorry, you must log in to view, edit or create Gear")
    end
  end

  def show
  end

  def new
    if user_signed_in?
      @gear = Gear.new
    else
      redirect_to(root_path,
        notice: "Sorry, you must log in to view, edit or create Gear")
    end
  end

  def edit
  end

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

  def destroy
    @gear.destroy
    respond_to do |format|
      format.html { redirect_to gears_url, notice: 'Gear was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_gear
      @gear = Gear.find(params[:id])
    end

    def check_auth
      if current_user.id != @gear.user_id
        redirect_to(gears_path,
          notice: "Sorry, you must log in to view, edit or create Gear")
      end
    end

    def gear_params
      params.require(:gear).permit(:title, :description, :picture, :user_id, :date_purchased, category_ids:[], gear_attributes:[:category])
    end
end
