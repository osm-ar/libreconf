class HomeController < ApplicationController
  def index
    @speakers = Speaker.all
    @sponsors = Sponsor.all(:order => :sponsor_type_id)
    @workshops = Workshop.all
    @abstracts = AbstractStatus.find(AbstractStatus::APPROVED).abstracts.order('is_key desc, created_at')
  end
end
