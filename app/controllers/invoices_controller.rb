class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  # GET /invoices
  # GET /invoices.json
  def index
    @organization = Organization.find(params[:organization_id])
    @invoices = @organization.invoice
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @line_items = @invoice.line_items
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @customers = @organization.customer
    @line_items = @invoice.line_items.build
  end

  # GET /invoices/1/edit
  def edit
    @customers = @organization.customer
    @line_items = @invoice.line_items
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = @organization.invoice.build(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to organization_invoices_path(@organization), notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to organization_invoices_path(@organization), notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to organization_invoices_path(@organization), notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:customer, :number, :order_number,
                                      :invoice_date, :salesperson, :terms, :due_date,
                                      :line_items_attributes => [:product, :description, :amount, :unit_price])
    end
end
