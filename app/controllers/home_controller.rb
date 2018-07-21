class HomeController < ApplicationController
  def index
    if current_user
      @class_index = 'btn btn-lg btn-outline-dark lg my-2 my-sm-0 invisible'
    else
      @class_index = 'btn btn-lg btn-outline-dark lg my-2 my-sm-0'
    end
  end
end
