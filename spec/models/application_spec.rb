require 'rails_helper'

RSpec.describe Application do
  it { should have_many(:pets).through(:pet_applications) }
end