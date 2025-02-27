module Cancellable
  extend ActiveSupport::Concern

  included do
    scope :cancelled, -> { where(cancelled: true) }
    scope :sort_latest, -> { order(created_at: :desc) }
    scope :active, -> { where(cancelled: false) }
  end

  
end
