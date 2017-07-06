class Dog < ActiveRecord::Base
  has_many :photos, as: :photoable
  belongs_to :contact
end
