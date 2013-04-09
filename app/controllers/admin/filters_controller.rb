class Admin::FiltersController < ApplicationController
  # GET /admin/filters
  # GET /admin/filters.json
  def index
    @admin_filters = Admin::Filter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_filters }
    end
  end

  # GET /admin/filters/1
  # GET /admin/filters/1.json
  def show
    @admin_filter = Admin::Filter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_filter }
    end
  end

  # GET /admin/filters/new
  # GET /admin/filters/new.json
  def new
    @admin_filter = Admin::Filter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_filter }
    end
  end

  # GET /admin/filters/1/edit
  def edit
    @admin_filter = Admin::Filter.find(params[:id])
  end

  # POST /admin/filters
  # POST /admin/filters.json
  def create
    @admin_filter = Admin::Filter.new(params[:admin_filter])

    respond_to do |format|
      if @admin_filter.save
        format.html { redirect_to @admin_filter, notice: 'Filter was successfully created.' }
        format.json { render json: @admin_filter, status: :created, location: @admin_filter }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/filters/1
  # PUT /admin/filters/1.json
  def update
    @admin_filter = Admin::Filter.find(params[:id])

    respond_to do |format|
      if @admin_filter.update_attributes(params[:admin_filter])
        format.html { redirect_to @admin_filter, notice: 'Filter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/filters/1
  # DELETE /admin/filters/1.json
  def destroy
    @admin_filter = Admin::Filter.find(params[:id])
    @admin_filter.destroy

    respond_to do |format|
      format.html { redirect_to admin_filters_url }
      format.json { head :no_content }
    end
  end
end
