require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it 'can create an subscription with the default factory' do
    subscription = create(:subscription)
    expect(subscription).to be_valid
  end

  it 'fails if the name is nil' do
    subscription = build(:subscription, name: nil)
    expect(subscription).to be_invalid
  end

  describe 'scopes' do
    describe '.cancelled' do
      it 'returns only cancelled subscriptions' do
        cancelled_subscription = create(:subscription, cancelled: true)
        active_subscription = create(:subscription)

        result = Subscription.cancelled
        expect(result).to include(cancelled_subscription)
        expect(result).not_to include(active_subscription)
      end
    end
  end
end
