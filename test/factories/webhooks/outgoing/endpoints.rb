# frozen_string_literal: true

FactoryBot.define do
  factory :webhooks_outgoing_endpoint, class: 'Webhooks::Outgoing::Endpoint' do
    association :team, factory: :team
    name { 'Example Endpoint' }
    url { 'https://example.com/some-endpoint-url' }
  end
end
