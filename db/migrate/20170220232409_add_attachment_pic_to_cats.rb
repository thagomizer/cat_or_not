class AddAttachmentPicToCats < ActiveRecord::Migration
  def self.up
    change_table :cats do |t|
      t.attachment :pic
    end
  end

  def self.down
    remove_attachment :cats, :pic
  end
end
