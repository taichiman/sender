require 'rails_helper'

describe Sheet do
  it{ should validate_presence_of :file_name }
  it{ should have_many :contacts }

end

