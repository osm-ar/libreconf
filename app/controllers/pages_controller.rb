class PagesController < ApplicationController
  @abstracts = Abstract.all #AbstractStatus.find(AbstractStatus::APPROVED).abstracts.order('is_key desc, created_at')
    
  def tourism
    if(I18n.locale == :en )
      render :tourism
    else
      render :tourism
    end
  end
  def accomodation
    if(I18n.locale == :en )
      render :accomodation
    else
      render :hospedaje
    end
  end
  def transportation
    if(I18n.locale == :en )
      render :calendar
    else
      render :calendar
    end
  end
  def CfP
    if(I18n.locale == :en )
      render :CfP
    else
      render :CfP_es
    end
  end
  def program
    if(I18n.locale == :en )
      render :program
    else
      render :program
    end
  end  
  def calendar
    if(I18n.locale == :en )
      render :calendar
    else
      render :calendar
    end
  end
  def videos
    if(I18n.locale == :en )
      render :videos
    else
      render :videos
    end
  end
  def press
    if(I18n.locale == :en )
      render :press
    else
      render :press
    end
  end
  def posters
    if(I18n.locale == :en )
      render :posters
    else
      render :posters
    end
  end
end
