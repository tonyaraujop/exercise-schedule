require 'rails_helper'

RSpec.describe "/routines", type: :request do
  let(:squat) {Exercise.create!(description: 'Squat', intensity: 4)}
  let(:snatch) {Exercise.create!(description: 'Snatch', intensity: 10)}

  let(:valid_attributes) {
    {:name => 'Monday', :exercise_ids => [squat.id, snatch.id]}
  }

  let(:user) { User.create(email: 'test@test.com', password: '123456') }
  let(:headers) { { Authorization: sign_in(user) } }

  describe "GET /index" do
    it "renders a successful response" do
      Routine.create! valid_attributes
      get routines_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      routine = Routine.create! valid_attributes
      get routine_path(routine), headers: headers
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_routine_path, headers: headers
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      routine = Routine.create! valid_attributes
      get edit_routine_path(routine), headers: headers
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Routine" do
        expect {
          post routines_path, headers: headers, params: { routine: valid_attributes }
        }.to change(Routine, :count).by(1)
      end

      it "redirects to the created routine" do
        post routines_path, headers: headers, params: { routine: valid_attributes }
        expect(response).to redirect_to(routine_path(Routine.last))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {:name => 'Sunday', :exercise_ids => [squat.id, snatch.id]}
      }

      it "updates the requested routine" do
        routine = Routine.create! valid_attributes
        patch routine_path(routine), headers: headers, params: { routine: new_attributes }
        routine.reload
        expect(response).to have_http_status(:found)
      end

      it "redirects to the routine" do
        routine = Routine.create! valid_attributes
        patch routine_path(routine), headers: headers, params: { routine: new_attributes }
        routine.reload
        expect(response).to redirect_to(routine_path(routine))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested routine" do
      routine = Routine.create! valid_attributes
      expect {
        delete routine_path(routine), headers: headers
      }.to change(Routine, :count).by(-1)
    end

    it "redirects to the routines list" do
      routine = Routine.create! valid_attributes
      delete routine_path(routine), headers: headers
      expect(response).to redirect_to(routines_path)
    end
  end
end
