class TranslateSpeakers < ActiveRecord::Migration
  def up
    Speaker.create_translation_table!({
      :title => :string,
      :description => :text
    }, {
      :migrate_data => true
    })
  end

  def down
    Speaker.drop_translation_table! :migrate_data => true
  end
end
