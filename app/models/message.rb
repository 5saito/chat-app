class Message < ApplicationRecord
  def change
    create_table :messages do |t|
      t.string :content
      t.references :room, foreign_key:true
      t.references :user, foreign_key:true
      t.timestamps
    end
  end

  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :content,presence: true, unless: :was_attached?

  def was_attached
    self.image.attached?
  end
end
