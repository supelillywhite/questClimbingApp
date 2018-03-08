class QuestsController < ApplicationController
  before_action :set_quest, only: [:show, :edit, :update, :destroy]
  before_action :check_auth, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @quests = current_user.quests
    else
      redirect_to(root_path,
        notice: "Sorry, you must log in to view/edit a Quest")
    end
  end

  def show
  end

  def new
    @quest = Quest.new
  end


  def edit
  end

  def create
    @quest = Quest.new(quest_params)
    @quest.user_id = current_user.id

    respond_to do |format|
      if @quest.save
        format.html { redirect_to @quest, notice: 'Quest was successfully created.' }
        format.json { render :show, status: :created, location: @quest }
      else
        format.html { render :new }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @quest.update(quest_params)
        format.html { redirect_to @quest, notice: 'Quest was successfully updated.' }
        format.json { render :show, status: :ok, location: @quest }
      else
        format.html { render :edit }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quest.destroy
    respond_to do |format|
      format.html { redirect_to quests_url, notice: 'Quest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_quest
      @quest = Quest.find(params[:id])
    end

    def check_auth
      if session[:user_id] != @quest.user_id
        redirect_to(quests_path,
          notice: "Sorry, you can't edit/view this Quest")
      end
    end

    
    def quest_params
      params.require(:quest).permit(:title, :description, :picture, :gear, :date, :location, :user_id, gear_ids:[], gear_attributes:[:title])
    end
end
