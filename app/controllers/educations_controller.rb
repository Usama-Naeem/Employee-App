class EducationsController < ApplicationController
    before_action :set_education, only: %i[ show edit update destroy ]
        def index
        @educations = Education.all
        end
    
        def show  
            
        end
    
        def edit 
        end
    
        def new
        @education = Education.new
        end
    
    def create
      @education = Education.new(education_params)

      @education.owner_id=current_employee.id
  
      respond_to do |format|
        if @education.save
          format.html { redirect_to education_url(@education), notice: "Education was successfully created." }
          format.json { render :show, status: :created, location: @education }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @education.errors, status: :unprocessable_entity }
        end
      end
    end
  

    def update
      respond_to do |format|
        if @education.update(education_params)
          format.html { redirect_to education_url(@education), notice: "Education was successfully updated." }
          format.json { render :show, status: :ok, location: @education }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @education.errors, status: :unprocessable_entity }
        end
      end
    end
  

    def destroy
      @education.destroy
  
      respond_to do |format|
        format.html { redirect_to educations_url, notice: "Education was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private

    def set_education 
        @education = Education.find(params[:id])
    end

    def education_params 
        params.require(:education).permit(:degree_title, :start_year, :end_year, :owner_id)

    end
end
