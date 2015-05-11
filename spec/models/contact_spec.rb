require 'rails_helper'

describe Contact do
  it { should validate_presence_of :name }
  it { should belong_to :sheet }

end

