class SkillsController < ApplicationController
  before_action :set_skill, only: %i[ show edit update destroy ]
    def index 
    @skills = Skill.all
    end

    def show 
    end

    def new 
        @skill= Skill.new
    end

    def edit 
        
    end


    def create
        @skill = Skill.new(skill_params)
        @skill.owner_id=current_employee.id
    
        respond_to do |format|
          if @skill.save
            format.html { redirect_to skill_url(@skill), notice: "skill was successfully created." }
            format.json { render :show, status: :created, location: @skill }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @skill.errors, status: :unprocessable_entity }
          end
        end
      end
    
  
      def update
        respond_to do |format|
          if @skill.update(skill_params)
            format.html { redirect_to skill_url(@skill), notice: "skill was successfully updated." }
            format.json { render :show, status: :ok, location: @skill }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @skill.errors, status: :unprocessable_entity }
          end
        end
      end
    
  
      def destroy
        @skill.destroy
    
        respond_to do |format|
          format.html { redirect_to skills_url, notice: "skill was successfully destroyed." }
          format.json { head :no_content }
        end
      end
     
    private

    def set_skill
        @skill = Skill.find(params[:id])
    end

    def skill_params 
        params.require(:skill).permit(:title, :owner_id)

    end


end
