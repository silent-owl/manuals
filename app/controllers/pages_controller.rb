class PagesController < ApplicationController
  def index
    @manuals = Manual.all 
  end 
end
