class HomeController < ApplicationController
  
  def index
      if user_signed_in? #checks to see if the user is signed in
              redirect_to :controller => 'todoo', :action => 'index' #if the user is sigend in goto the todoo controller then index.
            end
          end
end
