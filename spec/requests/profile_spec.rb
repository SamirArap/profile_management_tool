require 'rails_helper'

RSpec.describe "Profile", type: :request do
  before do
    @aki = User.create(first_name: "Aki",
                       last_name: "Aki",
                       email: "aki@example.com",
                       password: "password",
                       login: "username")

    @preda = User.create(first_name: "Preda",
                         last_name: "Preda",
                         email: "preda@example.com",
                         password: "password")
  end

  describe "GET /profile" do
    context "without github ID" do
      before do
        login_as(@preda)
        get "/profiles"
      end

      it "show user profile" do
        expect(response.status).to eq 200
      end
    end

    context "with github ID" do
      before do
        login_as(@aki)
        get "/profiles"
      end

      it "show github user profile" do
        expect(response.status).to eq 302
      end
    end

  end
end