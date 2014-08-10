class PagesController < ApplicationController
  @abstracts = Abstract.all #AbstractStatus.find(AbstractStatus::APPROVED).abstracts.order('is_key desc, created_at')
    
  def tourism
  end
  def accomodation
    if(I18n.locale == :en )
      render :accomodation
    else
      render :hospedaje
    end
  end
  def transportation
  end
  def CfP
    if(I18n.locale == :en )
      render :CfP
    else
      render :CfP_es
    end
  end
  def videos
  end
  def press
  end
  def posters
  end
end
