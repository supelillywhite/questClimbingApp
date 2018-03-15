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
    it "does not destroy a gear" do
      gear = create(:gear)

      delete :destroy, params: { id: gear.id }
      expect(Gear.all.size).to eq(1)
    end
  end
end