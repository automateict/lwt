class HomeController < ApplicationController

  def index
  end

  def guides
    render layout: 'guest-guides'
  end

  def complaints
    render layout: 'guest-complaints'
  end

end
