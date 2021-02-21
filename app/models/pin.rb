class Pin < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  acts_as_commontable dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true

  def self.search(search)
    if search
      pin = Pin.find_by(title: search)
      if pin
        self.where(["title LIKE ?","%${search}%"])
      else
        @pins = Pin.all
      end
    else
      @pins = Pin.all
    end
  end

end
