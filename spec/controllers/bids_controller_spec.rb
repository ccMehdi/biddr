require 'rails_helper'

RSpec.describe BidsController, type: :controller do
  let(:user) { create(:user) }
  let(:item) { create(:item, user: user)}

  describe "#create" do
    context "with user not signed in" do
      it "redirects to sign in page" do
        post :create, :item_id => item.id
        expect(response).to redirect_to new_session_path
      end
    end

    context "with user signed in" do
      before { login(user) }

      context "with valid parameters" do

        def valid_request
          post :create, :item_id => item.id, bid: attributes_for(:bid)
        end

        it "creates a bid in the database" do
          expect { valid_request }.to change { Bid.count }.by(1)
        end

        it "redirects to bid show page" do
          valid_request
          expect(response).to redirect_to item_path(Item.last)
        end

        it "sets a flash message" do
          valid_request
          expect(flash[:notice]).to be
        end

        it "associates the created item with the logged in user" do
          valid_request
          expect(Item.last.user).to eq(user)
        end
      end

      context "with invalid parameters" do
        def invalid_request
          post :create, :item_id => item.id, bid: {bid_amount: nil}
        end

        it "doesn't create a record in the database" do
          expect { invalid_request }.to change { Bid.count }.by(0)
        end

        it "renders the new template" do
          invalid_request
          expect(response).to render_template(:show)
        end
      end
    end
  end

end
