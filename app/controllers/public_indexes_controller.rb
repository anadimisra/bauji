	class PublicIndexesController < ApplicationController
	
	skip_before_action :authenticate_user!, if: :skip_user_authentication

  protected
    def skip_user_authentication
        request.format.json? && (action_name.eql?('show') || (action_name.eql?('index'))) 
    end  
end