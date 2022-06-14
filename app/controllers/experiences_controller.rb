class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[ show edit update destroy ]
      def index
      @experiences = Experience.all
      end

      # def total(start_date, end_date)
      #   @experiences= end_date.year - start_date.year
      # end
  
      def show  
          
      end
  
      def edit 
      end
  
      def new
      @experience = Experience.new
      end
  
  def create
    @experience = Experience.new(experience_params)
    @experience.owner_id=current_employee.id



    respond_to do |format|
      if @experience.save
        format.html { redirect_to experience_url(@experience), notice: "Experience was successfully created." }
        format.json { render :show, status: :created, location: @experience }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to experience_url(@experience), notice: "Experience was successfully updated." }
        format.json { render :show, status: :ok, location: @experience }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @experience.destroy

    respond_to do |format|
      format.html { redirect_to experiences_url, notice: "Experience was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_experience 
      @experience = Experience.find(params[:id])
  end

  def experience_params 
      params.require(:experience).permit(:job_title,:employee_name, :start_date, :end_date, :owner_id, :total_experience)

  end
end
