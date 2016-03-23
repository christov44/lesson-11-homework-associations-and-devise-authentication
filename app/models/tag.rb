class Tag < ActiveRecord::Base
  has_many :article_tags
  has_many :articles, through: :article_tags

  validates :name, presence: true
  validates :name, uniqueness: {case_sensitive: false}
end
