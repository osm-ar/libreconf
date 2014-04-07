class HomeController < ApplicationController
  def index
    @speakers = Speaker.all
    # FIX ME? #
    @sponsor_types = SponsorType.find_by_sql("SELECT sponsor_types.* FROM sponsor_types INNER JOIN sponsors ON sponsors.sponsor_type_id = sponsor_types.id GROUP BY sponsor_types.id")
    @sponsors = Sponsor.order(:sponsor_type_id)
    @workshops = Workshop.all
    @abstracts = Abstract.all #AbstractStatus.find(AbstractStatus::APPROVED).abstracts.order('is_key desc, created_at')
    @images = Dir.glob("app/assets/images/slides/*.jpg").map { |image| "slides/#{image.split('/').last}" }
  end
end
