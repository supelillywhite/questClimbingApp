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
end