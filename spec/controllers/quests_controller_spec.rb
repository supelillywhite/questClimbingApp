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
end