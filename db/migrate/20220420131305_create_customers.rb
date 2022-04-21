class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.references :team, null: false, foreign_key: true
      t.integer :syncroid
      t.string :firstname
      t.string :lastname
      t.string :businessname
      t.string :email
      t.string :phone
      t.string :mobile
      t.datetime :created
      t.datetime :updated
      t.string :pdf_url
      t.string :address
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.float :latitude
      t.float :longitude
      t.string :notes
      t.boolean :get_sms
      t.boolean :opt_out
      t.boolean :disabled
      t.boolean :no_email
      t.string :business_and_full_name
      t.string :business_then_name

      t.timestamps
    end
  end
end
