require 'spec_helper'

describe WelcomeController do
  describe "#index" do
    before { get :index }
    it "renders" do
      expect(response).to render_template("index")
    end
  end

  describe "#works" do
    before { get :works }
    it "renders" do
      expect(response).to render_template("works")
    end
  end
end
