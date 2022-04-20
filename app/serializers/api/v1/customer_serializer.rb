class Api::V1::CustomerSerializer < Api::V1::ApplicationSerializer
  set_type "customer"

  attributes :id,
    :team_id,
    :syncroid,
    :firstname,
    :lastname,
    :businessname,
    :email,
    :phone,
    :mobile,
    :created,
    :updated,
    :pdf_url,
    :address,
    :address_2,
    :city,
    :state,
    :zip,
    :latitude,
    :longitude,
    :notes,
    :get_sms,
    :opt_out,
    :disabled,
    :no_email,
    :business_and_full_name,
    :business_then_name,
    # 🚅 super scaffolding will insert new fields above this line.
    :created_at,
    :updated_at

  belongs_to :team, serializer: Api::V1::TeamSerializer
end
