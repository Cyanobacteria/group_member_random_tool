class ShowdatasController < ApplicationController

   def index 
     @groups = Group.all   
   end

end
