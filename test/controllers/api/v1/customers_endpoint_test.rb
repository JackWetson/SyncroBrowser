# frozen_string_literal: true

require 'test_helper'
require 'controllers/api/test'

module Api
  module V1
    class CustomersEndpointTest < Api::Test
      include Devise::Test::IntegrationHelpers

      def setup
        # See `test/controllers/api/test.rb` for common set up for API tests.
        super

        @customer = create(:customer, team: @team)
        @other_customers = create_list(:customer, 3)
      end

      # This assertion is written in such a way that new attributes won't cause the tests to start failing, but removing
      # data we were previously providing to users _will_ break the test suite.
      def assert_proper_object_serialization(customer_data)
        # Fetch the customer in question and prepare to compare it's attributes.
        customer = Customer.find(customer_data['id'])

        assert_equal customer_data['syncroid'], customer.syncroid
        assert_equal customer_data['firstname'], customer.firstname
        assert_equal customer_data['lastname'], customer.lastname
        assert_equal customer_data['businessname'], customer.businessname
        assert_equal customer_data['email'], customer.email
        assert_equal customer_data['phone'], customer.phone
        assert_equal customer_data['mobile'], customer.mobile
        assert_equal DateTime.parse(customer_data['created']), customer.created
        assert_equal DateTime.parse(customer_data['updated']), customer.updated
        assert_equal customer_data['pdf_url'], customer.pdf_url
        assert_equal customer_data['address'], customer.address
        assert_equal customer_data['address_2'], customer.address_2
        assert_equal customer_data['city'], customer.city
        assert_equal customer_data['state'], customer.state
        assert_equal customer_data['zip'], customer.zip
        assert_equal customer_data['latitude'], customer.latitude
        assert_equal customer_data['longitude'], customer.longitude
        assert_equal customer_data['notes'], customer.notes
        assert_equal customer_data['get_sms'], customer.get_sms
        assert_equal customer_data['opt_out'], customer.opt_out
        assert_equal customer_data['disabled'], customer.disabled
        assert_equal customer_data['no_email'], customer.no_email
        assert_equal customer_data['business_and_full_name'], customer.business_and_full_name
        assert_equal customer_data['business_then_name'], customer.business_then_name
        # 🚅 super scaffolding will insert new fields above this line.

        assert_equal customer_data['team_id'], customer.team_id
      end

      test 'index' do
        # Fetch and ensure nothing is seriously broken.
        get "/api/v1/teams/#{@team.id}/customers", params: { access_token: }
        assert_response :success

        # Make sure it's returning our resources.
        customer_ids_returned = response.parsed_body['data'].map { |customer| customer.dig('attributes', 'id') }
        assert_includes(customer_ids_returned, @customer.id)

        # But not returning other people's resources.
        assert_not_includes(customer_ids_returned, @other_customers[0].id)

        # And that the object structure is correct.
        assert_proper_object_serialization response.parsed_body['data'].first['attributes']
      end

      test 'show' do
        # Fetch and ensure nothing is seriously broken.
        get "/api/v1/customers/#{@customer.id}", params: { access_token: }
        assert_response :success

        # Ensure all the required data is returned properly.
        assert_proper_object_serialization response.parsed_body.dig('data', 'attributes')

        # Also ensure we can't do that same action as another user.
        get "/api/v1/customers/#{@customer.id}", params: { access_token: another_access_token }
        assert_response_specific_not_found
      end

      test 'create' do
        # Use the serializer to generate a payload, but strip some attributes out.
        customer_data = Api::V1::CustomerSerializer.new(build(:customer, team: nil)).serializable_hash.dig(:data,
                                                                                                           :attributes)
        customer_data.except!(:id, :team_id, :created_at, :updated_at)

        post "/api/v1/teams/#{@team.id}/customers",
             params: customer_data.merge({ access_token: })

        assert_response :success

        # Ensure all the required data is returned properly.
        assert_proper_object_serialization response.parsed_body.dig('data', 'attributes')

        # Also ensure we can't do that same action as another user.
        post "/api/v1/teams/#{@team.id}/customers",
             params: customer_data.merge({ access_token: another_access_token })
        # TODO: Why is this returning forbidden instead of the specific "Not Found" we get everywhere else?
        assert_response :forbidden
      end

      test 'update' do
        # Post an attribute update ensure nothing is seriously broken.
        put "/api/v1/customers/#{@customer.id}", params: {
          access_token:,
          syncroid: 'Alternative String Value',
          firstname: 'Alternative String Value',
          lastname: 'Alternative String Value',
          businessname: 'Alternative String Value',
          email: 'Alternative String Value',
          phone: 'Alternative String Value',
          mobile: 'Alternative String Value',
          pdf_url: 'Alternative String Value',
          address: 'Alternative String Value',
          address_2: 'Alternative String Value',
          city: 'Alternative String Value',
          state: 'Alternative String Value',
          zip: 'Alternative String Value',
          latitude: 'Alternative String Value',
          longitude: 'Alternative String Value',
          notes: 'Alternative String Value',
          business_and_full_name: 'Alternative String Value',
          business_then_name: 'Alternative String Value'
          # 🚅 super scaffolding will also insert new fields above this line.
        }

        assert_response :success

        # Ensure all the required data is returned properly.
        assert_proper_object_serialization response.parsed_body.dig('data', 'attributes')

        # But we have to manually assert the value was properly updated.
        @customer.reload
        assert_equal @customer.syncroid, 'Alternative String Value'
        assert_equal @customer.firstname, 'Alternative String Value'
        assert_equal @customer.lastname, 'Alternative String Value'
        assert_equal @customer.businessname, 'Alternative String Value'
        assert_equal @customer.email, 'Alternative String Value'
        assert_equal @customer.phone, 'Alternative String Value'
        assert_equal @customer.mobile, 'Alternative String Value'
        assert_equal @customer.pdf_url, 'Alternative String Value'
        assert_equal @customer.address, 'Alternative String Value'
        assert_equal @customer.address_2, 'Alternative String Value'
        assert_equal @customer.city, 'Alternative String Value'
        assert_equal @customer.state, 'Alternative String Value'
        assert_equal @customer.zip, 'Alternative String Value'
        assert_equal @customer.latitude, 'Alternative String Value'
        assert_equal @customer.longitude, 'Alternative String Value'
        assert_equal @customer.notes, 'Alternative String Value'
        assert_equal @customer.business_and_full_name, 'Alternative String Value'
        assert_equal @customer.business_then_name, 'Alternative String Value'
        # 🚅 super scaffolding will additionally insert new fields above this line.

        # Also ensure we can't do that same action as another user.
        put "/api/v1/customers/#{@customer.id}", params: { access_token: another_access_token }
        assert_response_specific_not_found
      end

      test 'destroy' do
        # Delete and ensure it actually went away.
        assert_difference('Customer.count', -1) do
          delete "/api/v1/customers/#{@customer.id}", params: { access_token: }
          assert_response :success
        end

        # Also ensure we can't do that same action as another user.
        delete "/api/v1/customers/#{@customer.id}", params: { access_token: another_access_token }
        assert_response_specific_not_found
      end
    end
  end
end
