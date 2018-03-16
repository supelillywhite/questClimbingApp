require 'rails_helper'

RSpec.describe GearsController, type: :controller do

  describe "POST #create" do
  	login_user
    context "with valid attributes" do
      it "create new gear" do

        post :create, params: {gear: attributes_for(:gear)}
        expect(Gear.count).to eq(1)
      end
    end
  end

  describe "DELETE destroy" do
    login_user
    it "destroys a gear when the user that created it is logged in" do
      gear = create(:gear, user: @user)

      delete :destroy, params: { id: gear.id }
      expect(controller).to set_flash[:notice].to("Gear was successfully destroyed.")
      expect(Gear.all.size).to eq(0)
    end
  end

  describe "can't DELETE destroy" do
   	login_user
    it "does not destroy a gear when the user that created it is not logged in" do
      gear = create(:gear)

      delete :destroy, params: { id: gear.id }
      expect(Gear.all.size).to eq(1)
    end
  end

  describe "GET Show" do
    login_user
    it "shows a gear when the user that created it is logged in" do
      gear = create(:gear, user: @user)

      get :show, params: { id: gear.id }

      expect(response).to be_success
    end
  end

  describe "can't GET Show" do
    login_user
    it "does not show a gear when the user that created it is not logged in" do
      gear = create(:gear)

      get :show, params: { id: gear.id }

      expect(response).to_not be_success
    end
  end

  describe "PATCH update" do
    login_user
    it "updates a gear when the user that created it is logged in" do
      gear = create(:gear, user: @user)

      patch :update, params: { 
        id: gear.id, gear: { 'title': 'A cup of cheese' } }
      gear.reload

      expect(gear.title).to eq('A cup of cheese')
    end
  end

  describe "can't PATCH update" do
    login_user
    it "does not update a gear when the user that created it is not logged in" do
      gear = create(:gear)

      patch :update, params: { 
        id: gear.id, gear: { 'title': 'A cup of cheese' } }
      gear.reload

      expect(gear.title).to_not eq('A cup of cheese')
    end
  end



end

