require 'cassandra/Keyspace'
require 'cassandra/Queries'

class HomeController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    skip_before_filter :verify_authenticity_token

    layout "application"

    def index
        @groups = Orthologs.all.size
    end

   
end

