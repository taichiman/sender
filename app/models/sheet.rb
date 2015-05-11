class Sheet < ActiveRecord::Base
  has_many :contacts

  validates :file_name, presence: true

end

