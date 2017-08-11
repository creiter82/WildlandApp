class CertificationsController < ApplicationController
  before_action :set_cert, only: [:edit, :update, :destroy]

  def index
    @certs = Certification.all
  end

  def new
    @cert = Certification.new
  end

  def create
    @cert = Certification.new(cert_params)
    respond_to do |format|
      if @cert.save
        format.html { redirect_to certifications_path, notice: "#{@cert.name.titleize} was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @cert.update(cert_params)
        format.html { redirect_to certifications_path, notice: "#{@cert.name.titleize} was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
  end

  private

    def set_cert
      @cert = Certification.find(params[:id])
    end
      
    def cert_params
       params.require(:certification).permit(:name, :acronym) 
    end
end
