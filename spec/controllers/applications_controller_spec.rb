require "spec_helper"

describe ApplicationsController do

  describe "GET #index" do
    it "shows a list of all applications" do
      application = FactoryGirl.create(:application)
      get :index
      assigns(:applications).should eq([application])
    end
    
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end
  
  describe "GET #show" do
    it "assigns the requested application to @application" do
      application = FactoryGirl.create(:application)
      get :show, id: application
      assigns(:app).should eq(application)
    end
    
    it "renders the :show view" do
      get :show, id: FactoryGirl.create(:application)
      response.should render_template :show
    end
  end
  
  describe "GET #start" do
    it "assigns the requested application to @application" do
      application = FactoryGirl.create(:application)
      get :show, id: application
      assigns(:app).should eq(application)
    end
    
    it "redirects to the application page" do
      get :show, id: FactoryGirl.create(:application)
      response.should render_template :show
    end
  end
  
  describe "POST #create" do
    it "saves the new application in the database" do
      expect{post :create, application: FactoryGirl.attributes_for(:application)}.to change(Application,:count).by(1)
    end
  end
  
end