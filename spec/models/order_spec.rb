require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'can create an order with the default factory' do
    order = create(:order)
    expect(order).to be_valid
  end

  it 'fails if the item_name is nil' do
    order = build(:order, item_name: nil)
    expect(order).to be_invalid
  end

  describe 'scopes' do
    describe '.cancelled' do
      it 'returns only cancelled orders' do
        cancelled_order = create(:order, cancelled: true)
        active_order = create(:order)

        result = Order.cancelled
        expect(result).to include(cancelled_order)
        expect(result).not_to include(active_order)
      end
    end
  end
end
