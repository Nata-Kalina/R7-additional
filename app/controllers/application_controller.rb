class ApplicationController < ActionController::Base
    def index
        @customers = Customer.all
      end
end
