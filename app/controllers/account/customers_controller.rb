class Account::CustomersController < Account::ApplicationController
  account_load_and_authorize_resource :customer, through: :team, through_association: :customers

  # GET /account/teams/:team_id/customers
  # GET /account/teams/:team_id/customers.json
  def index
    # if you only want these objects shown on their parent's show page, uncomment this:
    # redirect_to [:account, @team]
  end

  # GET /account/customers/:id
  # GET /account/customers/:id.json
  def show
  end

  # GET /account/teams/:team_id/customers/new
  def new
  end

  # GET /account/customers/:id/edit
  def edit
  end

  # POST /account/teams/:team_id/customers
  # POST /account/teams/:team_id/customers.json
  def create
    respond_to do |format|
      if @customer.save
        format.html { redirect_to [:account, @team, :customers], notice: I18n.t("customers.notifications.created") }
        format.json { render :show, status: :created, location: [:account, @customer] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/customers/:id
  # PATCH/PUT /account/customers/:id.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to [:account, @customer], notice: I18n.t("customers.notifications.updated") }
        format.json { render :show, status: :ok, location: [:account, @customer] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/customers/:id
  # DELETE /account/customers/:id.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to [:account, @team, :customers], notice: I18n.t("customers.notifications.destroyed") }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_params
    strong_params = params.require(:customer).permit(
      :syncroid,
      :firstname,
      :lastname,
      :businessname,
      :email,
      :phone,
      :mobile,
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
      # 🚅 super scaffolding will insert new arrays above this line.
    )

    assign_date_and_time(strong_params, :created)
    assign_date_and_time(strong_params, :updated)
    assign_boolean(strong_params, :get_sms)
    assign_boolean(strong_params, :opt_out)
    assign_boolean(strong_params, :disabled)
    assign_boolean(strong_params, :no_email)
    # 🚅 super scaffolding will insert processing for new fields above this line.

    strong_params
  end
end
