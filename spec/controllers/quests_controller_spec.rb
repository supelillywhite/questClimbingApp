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
end