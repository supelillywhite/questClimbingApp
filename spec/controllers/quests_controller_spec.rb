require 'rails_helper'

RSpec.describe QuestsController, type: :controller do

  describe "POST #create" do
  	login_user
    context "with valid attributes" do
      it "create new quest" do

        post :create, params: {quest: attributes_for(:quest)}
        expect(Quest.count).to eq(1)
      end
    end
  end

   describe "DELETE destroy" do
   	login_user
    it "destroys a quest when the user that created it is logged in" do
      quest = create(:quest, user: @user)

      delete :destroy, params: { id: quest.id }
      expect(controller).to set_flash[:notice].to("Quest was successfully destroyed.")
      expect(Quest.all.size).to eq(0)
    end
  end

  describe "can't DELETE destroy" do
   	login_user
    it "does not destroy a quest when the user that created it is not logged in" do
      quest = create(:quest)

      delete :destroy, params: { id: quest.id }
      expect(Quest.all.size).to eq(1)
    end
  end

  describe "GET Show" do
    login_user
    it "shows a quest when the user that created it is logged in" do
      quest = create(:quest, user: @user)

      get :show, params: { id: quest.id }

      expect(response).to be_success
    end
  end

  describe "can't GET Show" do
    login_user
    it "does not show a quest when the user that created it is not logged in" do
      quest = create(:quest)

      get :show, params: { id: quest.id }

      expect(response).to_not be_success
    end
  end

  describe "GET index" do
    login_user
    it "lists quests when the user that created them is logged in" do
      get :index

      expect(response).to be_success
    end
  end

  describe "can't GET index" do
    it "lists quests when the user that created them is logged in" do
      get :index

      expect(response).to_not be_success
    end
  end

  describe "PATCH update" do
    login_user
    it "updates a quest when the user that created it is logged in" do
      quest = create(:quest, user: @user)

      patch :update, params: { 
        id: quest.id, quest: { 'title': 'A cup of cheese' } }
      quest.reload

      expect(quest.title).to eq('A cup of cheese')
    end
  end

  describe "can't PATCH update" do
    login_user
    it "does not update a gear when the user that created it is not logged in" do
      quest = create(:quest)

      patch :update, params: { 
        id: quest.id, quest: { 'title': 'A cup of cheese' } }
      quest.reload

      expect(quest.title).to_not eq('A cup of cheese')
    end
  end

end



