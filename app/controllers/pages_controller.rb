class PagesController < ApplicationController
  def home
    @legislation = Legislation.find(1)
  end

  def dashboard
  end
end
