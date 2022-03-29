require 'rails_helper'

RSpec.describe "/routines", type: :request do
  
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Routine.create! valid_attributes
      get routines_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      routine = Routine.create! valid_attributes
      get routine_url(routine)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_routine_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      routine = Routine.create! valid_attributes
      get edit_routine_url(routine)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Routine" do
        expect {
          post routines_url, params: { routine: valid_attributes }
        }.to change(Routine, :count).by(1)
      end

      it "redirects to the created routine" do
        post routines_url, params: { routine: valid_attributes }
        expect(response).to redirect_to(routine_url(Routine.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Routine" do
        expect {
          post routines_url, params: { routine: invalid_attributes }
        }.to change(Routine, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post routines_url, params: { routine: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested routine" do
        routine = Routine.create! valid_attributes
        patch routine_url(routine), params: { routine: new_attributes }
        routine.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the routine" do
        routine = Routine.create! valid_attributes
        patch routine_url(routine), params: { routine: new_attributes }
        routine.reload
        expect(response).to redirect_to(routine_url(routine))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        routine = Routine.create! valid_attributes
        patch routine_url(routine), params: { routine: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested routine" do
      routine = Routine.create! valid_attributes
      expect {
        delete routine_url(routine)
      }.to change(Routine, :count).by(-1)
    end

    it "redirects to the routines list" do
      routine = Routine.create! valid_attributes
      delete routine_url(routine)
      expect(response).to redirect_to(routines_url)
    end
  end
end
