json.extract! invoice, :id, :customer, :number, :order_number, :invoice_date, :salesperson, :terms, :due_date, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)