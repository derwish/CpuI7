class LineItemsController < ApplicationController
  before_action :set_line_item, 
    only: [:show, :edit, :update, :destroy, :change_quantity ]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create 
    reset_view_counter
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to store_path }
        format.js { @current_item = @line_item }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to store_path }
      format.js { @cart = current_cart }
      format.json { head :ok }
    end
  end

  # POST /line_items/change_quantity/(:mod)
  def change_quantity
    @cart = current_cart

    case params[:mod]
    when '+1'
      @line_item.quantity += 1
    when '-1'
      @line_item.quantity -= 1
    else
      logger.error "Invalid change_quantity mod param #{params[:mod]}"
    end
    
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to store_path, notice: "Line item changed quantity. #{params[:mod]}" }
        format.js { @current_item = @line_item }
        format.json { head :ok }
      else
        format.html { redirect_to store_path, notice: "Line item failed to change quantity. #{params[:mod]}" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      begin
        @line_item = LineItem.find(params[:id])
      rescue ActiveRecord::RecordNotFound
          logger.error "Attempt to access invalid line_item #{params[:id]}"
          redirect_to store_url, notice: 'Invalid line_item'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id)
    end
end
