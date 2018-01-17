require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe "validations" do
    it "is invalid without first_name" do
      event = Event.new(first_name: "")
      event.valid?
      expect(event.errors).to have_key(:first_name)
    end
  end
end
