class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  # GET /houses
  # GET /houses.json
  def index
    if params[:listing_display]
      @houses = current_seller.houses.where(listing_display: params[:listing_display]).paginate(page: params[:page],per_page:7)
    else
      @houses = current_seller.houses.paginate(page: params[:page],per_page:7)
    end
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
    if seller_signed_in?
      @house = House.find(params[:id])
      @photos = @house.photos
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @house }
    end
      else
      flash[:danger]="No access"
    end
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = current_seller.houses.build(house_params)

    respond_to do |format|
      if @house.save

        if params[:images]
        params[:images].each { |image|
          @house.photos.create(image: image)
        }
        end

        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        if params[:images]
          params[:images].each { |image|
            @house.photos.create(image: image)
          }
          end
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:title, :description, :location, :price, :house_structure, :address, :listing_display, :status, :photos)
    end
end
