class CertificationsController < ApplicationController
  before_action :set_cert, only: [:create, :edit, :update, :destroy]

  def index
    @certs = Certification.all
  end

  def new
    @cert = Certification.new
  end

  def create
  end

  def edit
  end

  def update
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
