require 'carmen'

connection      = ActiveRecord::Base.connection
country_inserts = []

country_values = -> do
  Carmen::Country.all.each do |country|
    name            = connection.quote country.name
    iso3            = connection.quote country.alpha_3_code
    iso             = connection.quote country.alpha_2_code
    iso_name        = connection.quote country.name.upcase
    numcode         = connection.quote country.numeric_code
    # states_required = connection.quote country.subregions?

    country_inserts << [name, iso3, iso, iso_name, numcode].join(", ")
  end

  country_inserts.join("), (")
end

columns = ["name", "iso3", "iso", "iso_name", "numcode"]
columns = connection.adapter_name =~ /MySQL/i ? columns.join(", ") : "\"#{columns.join('", "')}\""

connection.execute <<-SQL
  INSERT INTO countries (#{columns})
  VALUES (#{country_values.call});
SQL

# Spree::Config[:default_country_id] = Spree::Country.find_by(iso: "US").id

# find countries that do not use postal codes (by iso) and set 'zipcode_required' to false for them.

# Country.where(iso: Spree::Address::NO_ZIPCODE_ISO_CODES).update_all(zipcode_required: false)
