# frozen_string_literal: true

class AddPayloadToWebhooksOutgoingEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :webhooks_outgoing_events, :payload, :jsonb
  end
end
