class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'a98bd9c57315aad6ebcea5fb7a228c7a'
  
  include AuthenticatedSystem
  before_filter :login_from_cookie

  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

	def create_activity(text, reference)
		Activity.create(:user_id => current_user.id, :text => text, :reference => reference)
	end
	
	# hash-based authentication
	def hash_required
		@user = User.find_by_login(params[:u])
		if @user and @user.hash == params[:hash]
			return true
		end

		# hash authentication failed, don't render feed
		render :nothing => true, :status => 403 and return
	end
	
end
