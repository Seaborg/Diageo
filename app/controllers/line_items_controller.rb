require 'prawn'
require 'prawn/core'
require 'prawn/layout'
class LineItemsController < ApplicationController
 skip_before_filter :authorize, :only => :create
  # GET /line_items
  # GET /line_items.xml
  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.xml
  def show
    @line_item = LineItem.find(params[:id])
    
  	#zmienna locale potrzebna do druku tekstu promocyjnego
  	@test = Order.where(:id => @line_item.order_id)
  	@a = @test[0]
  	@a.promotext
  	
  	#zmienna locale potrzebna do sciezki jpga => do druku pdf-a
  	url = Product.where(:id => @line_item.product_id)
  	@b = url[0]
  	@b.image_url 
  	
  	#zmienna locale potrzebna do szerokosci jpga = > do druku pdfa
  	width = Product.where(:id => @line_item.product_id)
  	@c = url[0]
  	@c.width.to_i
  	
  	#zmienna locale potrzebna do dlugosci jpga = > do druku pdfa
  	length = Product.where(:id => @line_item.product_id)
  	@d = url[0]
  	@d.length

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @line_item }
      format.pdf { render :layout => false }
      
    end
    
    # @test = Order.where(:id => @line_item.order_id)
    #@test = Order.where(:id => 113)    
    #@test = Order.find_by_id(1)
  
  end

  # GET /line_items/new
  # GET /line_items/new.xml
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.xml
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to(store_url) }
        format.js { @current_item = @line_item }        
        format.xml { render :xml => @line_item,
          :status => :created, :location => @line_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @line_item.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.xml
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to(@line_item, :notice => 'Line item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.xml
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to(line_items_url) }
      format.xml  { head :ok }
    end
  end
  
end
