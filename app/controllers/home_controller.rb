class HomeController < ApplicationController

  def index
    @petitions = current_user.load_petitions rescue nil
    @complaints = current_user.load_complaints rescue nil
  end

  def guides
    render layout: 'guest-guides'
  end

  def complaints
    render layout: 'guest-complaints'
  end

end
