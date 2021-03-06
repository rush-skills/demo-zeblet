class ClinicsController < ApplicationController
  before_action :set_clinic, only: [:show, :edit, :update, :destroy, :add_doctor, :update_doctor, :remove_doctor]
  # before_action :authenticate_user
  # GET /clinics
  # GET /clinics.json
  def index
    if doctor_signed_in?
      if current_doctor.clinic
        redirect_to current_doctor.clinic
      else
        redirect_to new_clinic_path
      end
    end
    if params[:search].present?
      @clinics = Clinic.near(params[:search], 10)
    else
      @clinics = Clinic.all
    end
  end

  # GET /clinics/1
  # GET /clinics/1.json
  def show
  end

  # GET /clinics/new
  def new
    @clinic = Clinic.new
  end

  # GET /clinics/1/edit
  def edit
  end

  # POST /clinics
  # POST /clinics.json
  def create
    @clinic = Clinic.new(clinic_params)
    if doctor_signed_in?
      current_doctor.clinic = @clinic
      current_doctor.save!
    end
    respond_to do |format|
      if @clinic.save
        format.html { redirect_to @clinic, notice: 'Clinic was successfully created.' }
        format.json { render :show, status: :created, location: @clinic }
      else
        format.html { render :new }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinics/1
  # PATCH/PUT /clinics/1.json
  def update
    respond_to do |format|
      if @clinic.update(clinic_params)
        format.html { redirect_to @clinic, notice: 'Clinic was successfully updated.' }
        format.json { render :show, status: :ok, location: @clinic }
      else
        format.html { render :edit }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinics/1
  # DELETE /clinics/1.json
  def destroy
    @clinic.destroy
    respond_to do |format|
      format.html { redirect_to clinics_url, notice: 'Clinic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_doctor
    @doctors = Doctor.all
  end

  def update_doctor
    d = Doctor.find(clinic_doctor_params[:doctor_id])
    d.clinic = @clinic
    d.save!
    redirect_to @clinic
  end

  def remove_doctor
    d = Doctor.find(params[:did])
    d.clinic = nil
    d.save!
    redirect_to @clinic
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinic
      @clinic = Clinic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinic_params
      params.require(:clinic).permit(:name, :address)
    end

    def clinic_doctor_params
      params.require(:clinic).permit(:doctor_id)
    end
end
