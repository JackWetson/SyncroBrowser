# frozen_string_literal: true

FactoryBot.define do
  factory :memberships_reassignments_assignment, class: 'Memberships::Reassignments::Assignment' do
    membership { nil }
    scaffolding_completely_concrete_tangible_things_reassignment { nil }
  end
end
