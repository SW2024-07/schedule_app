class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 } # タイトルは必須かつ最大255文字
end
