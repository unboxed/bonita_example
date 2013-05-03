class ApplicationsController < ApplicationController
  
  def index
    @applications = Application.all
    @processes = BonitaHandler.new.processes
  end
  
  def show
    @app = Application.find(params[:id])
    @state = BonitaHandler.new.process_state(@app.process) unless @app.process.nil?
  end
  
  def start
    @app = Application.find(params[:id])
    response = BonitaHandler.new.create_process
    @app.update_attributes(:process => response)
    redirect_to @app
  end
end