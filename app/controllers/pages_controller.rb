class PagesController < ApplicationController
  def home
    @legislation = Legislation.find(1)
  end
end
