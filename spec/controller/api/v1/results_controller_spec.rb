require 'rails_helper'

RSpec.describe "Api::V1::Results", type: :request do
  describe "GET /api/v1/results" do
    it "returns all results as JSON" do
      result1 = Result.create!(student_name: "Pragati", subject: "Math", marks: 90, submitted_at: Time.current)
      result2 = Result.create!(student_name: "Kalash", subject: "Science", marks: 85, submitted_at: Time.current)

      get "/api/v1/results"

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.size).to eq(2)
      expect(json.map { |r| r["student_name"] }).to contain_exactly("Pragati", "Kalash")
    end
  end

  describe "POST /api/v1/results" do
    context "with valid params" do
      let(:valid_params) do
        {
          result: {
            student_name: "Kalash",
            subject: "History",
            marks: 75,
            submitted_at: Time.current
          }
        }
      end

      it "creates a new result and returns success" do
        expect {
          post "/api/v1/results", params: valid_params
        }.to change(Result, :count).by(1)

        expect(response).to have_http_status(:created)
        json = JSON.parse(response.body)
        expect(json["status"]).to eq("success")
        expect(json["id"]).to be_present
      end
    end

    context "with invalid params" do
      let(:invalid_params) do
        {
          result: {
            student_name: "", # invalid
            subject: "English",
            marks: nil,
            submitted_at: Time.current
          }
        }
      end

      it "does not create a result and returns errors" do
        expect {
          post "/api/v1/results", params: invalid_params
        }.not_to change(Result, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        json = JSON.parse(response.body)
        expect(json["status"]).to eq("error")
        expect(json["errors"]).to include("Student name can't be blank")
      end
    end
  end
end
