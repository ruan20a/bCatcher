class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:new, :show, :edit, :update, :delete]
  before_action :correct_user, only: [:show, :edit, :update, :delete]
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    @user_id = current_user.id
    @categories = Category.all
  end

  # GET /items/1/edit
  def edit
    @user_id = current_user.id
    @categories = Category.all
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        check_price
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    user = @item.user
    @item.destroy
    respond_to do |format|
      format.html { redirect_to user_path(user) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:user_id, :category_id, :title, :price, :size, :color, :is_changed, :is_private, :notes, :image_url, :required_price, :sale_price, :source_url)
    end

    def correct_user
      @item = Item.find(params[:id])
      redirect_to login_path, notice: "You cannot view this item because you're not the correct owner. Please login to the correct account." unless @item.user == current_user
    end

    def signed_in_user
      redirect_to login_path, notice: "Please login to view." unless signed_in?
    end

    def check_price
      if @item.price == @item.required_price
        UpdateMailer.update_price(@item.user, @item).deliver
      else if @item.sale_price == @item.required_price
        UpdateMailer.update_price(@item.user, @item).deliver
      end
    end
end
