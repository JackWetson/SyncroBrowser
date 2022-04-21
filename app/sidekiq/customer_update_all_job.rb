class CustomerUpdateAllJob
  include Sidekiq::Job
  require "httparty"

  def perform(id)
    # PARAMS:
    # Team:
    entity = Team.where(id: id).first
    # Do something
    page = 1

    response = HTTParty.get("https://atemait.syncromsp.com/api/v1/customers?page=" + page.to_s + "&api_key=" + entity.api)
    if response.code == 200
      ## Process each customer
      payload = response.parsed_response
      payload["customers"].each do |cust|
        customer = Customer.find_or_create_by(syncroid: cust["id"])
        customer.syncroid = cust["id"].to_i
        customer.team = entity
        customer.firstname = cust["firstname"]
        customer.lastname = cust["lastname"]
        customer.businessname = cust["business_name"]
        customer.email = cust["email"]
        customer.phone = cust["phone"]
        customer.mobile = cust["mobile"]
        customer.save!
      end
      ## If there are more pages go again
    end
  end
end
