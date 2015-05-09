require 'rails_helper'

describe ForecastController, type: :controller, vcr: true do

  let(:location) { 'London' }

  describe "GET #show" do
    it "returns http success" do
      get :show, { :format => :json, :location => location }
      expect(response).to have_http_status(:success)
    end
  end

end
