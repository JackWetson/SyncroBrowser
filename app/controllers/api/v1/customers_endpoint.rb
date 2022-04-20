class Api::V1::CustomersEndpoint < Api::V1::Root
  helpers do
    params :team_id do
      requires :team_id, type: Integer, allow_blank: false, desc: "Team ID"
    end

    params :id do
      requires :id, type: Integer, allow_blank: false, desc: "Customer ID"
    end

    params :customer do
      optional :syncroid, type: String, desc: Api.heading(:syncroid)
      optional :firstname, type: String, desc: Api.heading(:firstname)
      optional :lastname, type: String, desc: Api.heading(:lastname)
      optional :businessname, type: String, desc: Api.heading(:businessname)
      optional :email, type: String, desc: Api.heading(:email)
      optional :phone, type: String, desc: Api.heading(:phone)
      optional :mobile, type: String, desc: Api.heading(:mobile)
      optional :created, type: DateTime, desc: Api.heading(:created)
      optional :updated, type: DateTime, desc: Api.heading(:updated)
      optional :pdf_url, type: String, desc: Api.heading(:pdf_url)
      optional :address, type: String, desc: Api.heading(:address)
      optional :address_2, type: String, desc: Api.heading(:address_2)
      optional :city, type: String, desc: Api.heading(:city)
      optional :state, type: String, desc: Api.heading(:state)
      optional :zip, type: String, desc: Api.heading(:zip)
      optional :latitude, type: String, desc: Api.heading(:latitude)
      optional :longitude, type: String, desc: Api.heading(:longitude)
      optional :notes, type: String, desc: Api.heading(:notes)
      optional :get_sms, type: Boolean, desc: Api.heading(:get_sms)
      optional :opt_out, type: Boolean, desc: Api.heading(:opt_out)
      optional :disabled, type: Boolean, desc: Api.heading(:disabled)
      optional :no_email, type: Boolean, desc: Api.heading(:no_email)
      optional :business_and_full_name, type: String, desc: Api.heading(:business_and_full_name)
      optional :business_then_name, type: String, desc: Api.heading(:business_then_name)
      # 🚅 super scaffolding will insert new fields above this line.
      # 🚅 super scaffolding will insert new arrays above this line.

      # 🚅 super scaffolding will insert processing for new fields above this line.
    end
  end

  resource "teams", desc: Api.title(:collection_actions) do
    after_validation do
      load_and_authorize_api_resource Customer
    end

    #
    # INDEX
    #

    desc Api.title(:index), &Api.index_desc
    params do
      use :team_id
    end
    oauth2
    paginate per_page: 100
    get "/:team_id/customers" do
      @paginated_customers = paginate @customers
      render @paginated_customers, serializer: Api.serializer
    end

    #
    # CREATE
    #

    desc Api.title(:create), &Api.create_desc
    params do
      use :team_id
      use :customer
    end
    route_setting :api_resource_options, permission: :create
    oauth2 "write"
    post "/:team_id/customers" do
      if @customer.save
        render @customer, serializer: Api.serializer
      else
        record_not_saved @customer
      end
    end
  end

  resource "customers", desc: Api.title(:member_actions) do
    after_validation do
      load_and_authorize_api_resource Customer
    end

    #
    # SHOW
    #

    desc Api.title(:show), &Api.show_desc
    params do
      use :id
    end
    oauth2
    route_param :id do
      get do
        render @customer, serializer: Api.serializer
      end
    end

    #
    # UPDATE
    #

    desc Api.title(:update), &Api.update_desc
    params do
      use :id
      use :customer
    end
    route_setting :api_resource_options, permission: :update
    oauth2 "write"
    route_param :id do
      put do
        if @customer.update(declared(params, include_missing: false))
          render @customer, serializer: Api.serializer
        else
          record_not_saved @customer
        end
      end
    end

    #
    # DESTROY
    #

    desc Api.title(:destroy), &Api.destroy_desc
    params do
      use :id
    end
    route_setting :api_resource_options, permission: :destroy
    oauth2 "delete"
    route_param :id do
      delete do
        render @customer.destroy, serializer: Api.serializer
      end
    end
  end
end
