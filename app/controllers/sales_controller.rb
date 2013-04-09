class SalesController < ApplicationController
	before_filter :check_fraud_filter,:only=>[:create,:update]


	def check_fraud_filter
  		@sale = Sale.new(params[:sale])
			total_amount = @sale.total_amount
			filters = Admin::Filter.all
			filters.each do |filter|
				apply_filter  = false
				case (filter.condition)
				when 'order_amount'
					case filter.operator
						when 'is'
							if (@sale.total_amount == filter.value.to_f)
								apply_filter = true
							end
						when 'greater_than'
							if (@sale.total_amount > filter.value.to_f)
								apply_filter = true
							end

						when 'greater_than_eql'
							if (@sale.total_amount >= filter.value.to_f)
								apply_filter = true
							end

						when 'less_than'
							if (@sale.total_amount < filter.value.to_f)
								apply_filter = true
							end
						when 'less_than_eql'
							if (@sale.total_amount <= filter.value.to_f)
								apply_filter = true
							end
					end
				when 'order_country'
						if (@sale.country <= filter.value)
							apply_filter = true
						end
				when 'order_gateway'
						if (@sale.gateway <= filter.value)
							apply_filter = true
						end
				when 'order_email'
						if (@sale.email <= filter.value)
							apply_filter = true
						end
				end

				if apply_filter
					case(filter.action_type)
						when 'cancel_order' then
							params[:sale][:order_status] = 'cancel_order'
							flash[:error] = "Your order is cancel.Because your order #{filter.condition} #{filter.operator} #{filter.value}."
						when 'close_order' then 
							params[:sale][:order_status] = 'close_order'
							flash[:error] = "Your order is close.Because your order #{filter.condition} #{filter.operator} #{filter.value}."
						when 'send_an_email' then
							params[:sale][:order_status] = 'send_an_email'
							msg = "This msg is sent to you ,because order #{filter.condition} #{filter.operator} #{filter.value}."
							NotificationMailer.notify(@sale.email,"Order Placed",msg).deliver
							NotificationMailer.notify("jony@idifysolutions.com","Order Placed",msg).deliver
						when 'send_an_sms' then
							params[:sale][:order_status] = 'send_an_sms'
							msg = "This msg is sms to you ,because order #{filter.condition} #{filter.operator} #{filter.value}."
							NotificationMailer.notify("jony@idifysolutions.com","Order Placed",msg).deliver
							NotificationMailer.notify(@sale.email,"Order Placed",msg).deliver
					end
				end
			end
	end

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales }
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @sale = Sale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sale }
    end
  end

  # GET /sales/new
  # GET /sales/new.json
  def new
    @sale = Sale.new
		@product = Product.find_by_slug(params[:product_id])
		sale_products = @sale.sale_products.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sale }
    end
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(params[:sale])
		@product = Product.find(params[:sale][:sale_products_attributes]["0"][:product_id])
    respond_to do |format|
      if @sale.save
				format.html { redirect_to products_url,notice: 'Order was placed successfully.'}
        format.json { render json: @sale, status: :created, location: @sale }
      else
        format.html { render action: "new" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sales/1
  # PUT /sales/1.json
  def update
    @sale = Sale.find(params[:id])
		@product = Product.find(params[:sale][:sale_products_attributes]["0"][:product_id])

    respond_to do |format|
      if @sale.update_attributes(params[:sale])
        format.html { redirect_to products_url, notice: 'Sale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to sales_url }
      format.json { head :no_content }
    end
  end
end
