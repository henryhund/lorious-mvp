class SearchController < ApplicationController

  def new
    @experts = Expert.all
  end

end
