require 'rails_helper'

RSpec.describe "Dsb", type: :request do
  describe "GET /index" do
    let(:merchant) { create(:merchant) }

    context 'when both params are present' do
      it "returns http success" do
        get "/dsb/index", params: { start_date: '2021_4_13', merchant_id: merchant.id }
        expect(response).to have_http_status(:success)
      end
    end

    context 'when optional param merchant_id is missing' do
      it "returns http success" do
        get "/dsb/index", params: { start_date: '2021_4_13' }
        expect(response).to have_http_status(:success)
      end
    end

    context 'when required param start_date is missing' do
      it "returns a message" do
        get "/dsb/index", params: {}
        expect(response.parsed_body).to eq({"message"=>"required param start_date missing"})
        expect(response).to have_http_status(422)
      end
    end
  end
end
