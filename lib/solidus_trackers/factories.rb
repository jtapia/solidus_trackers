# NOTE: use 'spree_tracker' because Solids < 2 has itw own tracker factory

FactoryBot.define do
  factory :spree_tracker, class: Spree::Tracker do
    analytics_id 'A100'
    active true
    tracker_type 'analytics'
  end
end
