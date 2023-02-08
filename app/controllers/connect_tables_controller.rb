class ConnectTablesController < ApplicationController
    # skip_before_action :verify_authenticity_token

    def index
        c=ConnectTable.all 
        render json: c
    end

end
