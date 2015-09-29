class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @user = current_user
    @registered_application = @user.registered_applications.build(params.require(:registered_application).permit(:name, :url, :user_id))
    
    if @registered_application.save
      flash[:notice] = "The application was successfully added."
      redirect_to registered_applications_path
    else
      flash[:error] = "There was a problem adding that application."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    
    if @registered_application.delete
      flash[:notice] = "Application successfully deleted."
      redirect_to registered_applications_path
    else
      flash[:error] = "There was a problem deleting application."
      render :back
    end
  end
end
