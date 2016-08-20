require 'rails_helper'

RSpec.describe Movement, type: :model do
  it "does not allow other kinds" do
    expect(FactoryGirl.build(:movement,kind: Movement.kinds[:bodyweight])).to be_valid
    expect(FactoryGirl.build(:movement, kind: Movement.kinds[:test])).not_to be_valid
  end
end
