class HomeController < ApplicationController

  def index
    @petitions = Petition.order('created_at DESC').paginate(:page => params[:page],:per_page => 8)
    @complaints = current_user.load_complaints rescue nil
  end

  def guides
    render layout: 'guest-guides'
  end

  def complaints
    render layout: 'guest-complaints'
  end

end
