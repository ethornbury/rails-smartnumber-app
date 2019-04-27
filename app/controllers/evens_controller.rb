require 'even_number'

class EvensController < ApplicationController
  before_action :set_even, only: [:show, :edit, :update, :destroy]

  def isNumberEven
    @number_to_check=params[:check_number] 
    @is_even = EvenNumber.isEven(@number_to_check.to_i) #sending number to the method isEven in the /lib/even_number.rb
    
    if @is_even
      @is_even = " is even"
    else
      @is_even = " is not even"
    end
  end
  
  
  # GET /evens
  # GET /evens.json
  def index
    # the table contains both even and odd numbers
    @numbers = Even.all
    
    ## select the even numbers
    @evenData = []
    @oddData = []
    @numbers.each do |n| 
       @is_even = EvenNumber.isEven(n.number)
       if @is_even
         @evenData << n.number
       else
         @oddData << n.number
       end
    end
  end

  # GET /evens/1
  # GET /evens/1.json
  def show
  end

  # GET /evens/new
  def new
    @even = Even.new
  end

  # GET /evens/1/edit
  def edit
  end

  # POST /evens
  # POST /evens.json
  def create
    @even = Even.new(even_params)

    respond_to do |format|
      if @even.save
        format.html { redirect_to @even, notice: 'Even was successfully created.' }
        format.json { render :show, status: :created, location: @even }
      else
        format.html { render :new }
        format.json { render json: @even.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evens/1
  # PATCH/PUT /evens/1.json
  def update
    respond_to do |format|
      if @even.update(even_params)
        format.html { redirect_to @even, notice: 'Even was successfully updated.' }
        format.json { render :show, status: :ok, location: @even }
      else
        format.html { render :edit }
        format.json { render json: @even.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evens/1
  # DELETE /evens/1.json
  def destroy
    @even.destroy
    respond_to do |format|
      format.html { redirect_to evens_url, notice: 'Even was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_even
      @even = Even.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def even_params
      params.require(:even).permit(:number)
    end
end
