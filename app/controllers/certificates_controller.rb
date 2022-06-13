class CertificatesController < ApplicationController
    before_action :set_certificate, only: %i[ show edit update destroy ]
    def index 
        @certificates = Certificate.all
    end

    def show 
    end

    def edit 
    end

    
    def new
        @certificate=Certificate.new 
    end 


    def update
        respond_to do |format|
          if @certificate.update(certificate_params)
            format.html { redirect_to certificates_url(@certificate), notice: "certificate was successfully updated." }
            format.json { render :show, status: :ok, location: @certificate}
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @certificate.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        @certificate.destroy
    
        respond_to do |format|
          format.html { redirect_to certificates_url, notice: "certificate was successfully destroyed." }
          format.json { head :no_content }
        end
      end


      def create
        @certificate = Certificate.new(certificate_params)

        @certificate.owner_id=current_employee.id

    
        respond_to do |format|
          if @certificate.save
            format.html { redirect_to certificate_url(@certificate), notice: "certificate was successfully created." }
            format.json { render :show, status: :created, location: @certificate}
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @certificate.errors, status: :unprocessable_entity }
          end
        end
      end

    private

    def set_certificate
        @certificate = Certificate.find(params[:id])
    end

    def certificate_params 
        params.require(:certificate).permit(:title, :expiration_date, :owner_id)

    end
end
    

