class API::EventsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    before_filter :set_access_control_headers
    
    def index
    end
    
    def set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*' # allow requests from any origin.
        headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS' #permit the POST, GET, OPTIONS request methods.
        headers['Access-Control-Allow-Headers'] = 'Content-Type' # allow the header Content-Type, - used in HTTP requests to declare the type of the data being sent.
    end
    
    def create
        @registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
        
        if @registered_application == nil
           render json: "Unregistered application", status: :unprocessable_entity
       else
            @event = @registered_application.events.build(event_params)
        
            if @event.save
                render json: @event, status: :created
            else
                render @event.errors, status: :unprocessable_entity
            end
        end
    end
    
    
    private
    
    def event_params
        params.permit(:name)
    end
end