class HomeController < ApplicationController
  def index
    @speakers = Speaker.all
    @sponsors = Sponsor.order(:sponsor_type_id)
    @workshops = Workshop.all
    @abstracts = Abstract.all #AbstractStatus.find(AbstractStatus::APPROVED).abstracts.order('is_key desc, created_at')
    @images = Dir.glob("app/assets/images/slides/*.jpg").map { |image| "slides/#{image.split('/').last}" }
  end
end
