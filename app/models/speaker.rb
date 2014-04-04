class Speaker < ActiveRecord::Base
  translates :title, :description
  class Translation
  end
end
