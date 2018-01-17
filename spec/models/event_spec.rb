require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it "is invalid without description" do
      event = Event.new(description: "")
      event.valid?
      expect(event.errors).to have_key(:description)
    end
    it "is invalid with a description longer than 500 characters" do
      event = Event.new(description: "a"*501)
      event.valid?
      expect(event.errors).to have_key(:description)
    end
    it "is invalid with a name longer than 50 characters" do
      event = Event.new(name: "a"*51)
      event.valid?
      expect(event.errors).to have_key(:name)
    end
    it "is invalid without name" do
      event = Event.new(name: "")
      event.valid?
      expect(event.errors).to have_key(:name)
    end
    it "is invalid without size" do
      event = Event.new(size: nil)
      event.valid?
      expect(event.errors).to have_key(:size)
    end
    it "is invalid without location" do
      event = Event.new(location: nil)
      event.valid?
      expect(event.errors).to have_key(:location)
    end
    it "is invalid without price" do
      event = Event.new(price: nil)
      event.valid?
      expect(event.errors).to have_key(:price)
    end
    it "is invalid without starts at" do
      event = Event.new(starts_at: nil)
      event.valid?
      expect(event.errors).to have_key(:starts_at)
    end
    it "is invalid without ends at" do
      event = Event.new(ends_at: nil)
      event.valid?
      expect(event.errors).to have_key(:ends_at)
    end
  end

  describe "bargain?" do
    let!(:cheap_event) {create :event, price: 29}
    let!(:expensive_event) {create :event, price: 300}
    let!(:medium_event) {create :event, price: 30}
    it "event is less then 30" do
      expect(cheap_event.bargain?).to eq true
    end
    it "event is more then or equal to 30" do
      expect(expensive_event.bargain?).to eq false
      expect(medium_event.bargain?).to eq false
    end
  end

  describe "validates user to event owner user" do
    let!(:user1) {create :user}
    let!(:event1) { create :event, user: user1 }
    it "user is equal to event owner" do
      result = event1.validate_user?(user1)
      expect(result).to eq(true)
    end
  end

  describe "order_by_price for events" do
    let!(:cheap_event) {create :event, price: 29}
    let!(:expensive_event) {create :event, price: 300}
    let!(:medium_event) {create :event, price: 30}

    it "check if order is ascending" do
      expected = [cheap_event, medium_event, expensive_event]
      expect(Event.order_by_price).to eq(expected)
    end

  end
end
