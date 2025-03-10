class ApplicantsController < ApplicationController
  def show
    
    if params[:admin].present?
      @admin_mode = true
      applicant = Applicant.find(params[:id])
      pets = applicant.pets
      @applicant_pet = PetApplication.find(applicant_id: params[:id], )
      binding.pry
      @status = PetApplication.adoption_status("#{applicant.id}", "#{pet.id}")
    end
    @applicant = Applicant.find(params[:id])
    if params[:pet_search].present?
      @pets = Pet.search(params[:pet_search])
    end
  end

  def update
    applicant = Applicant.find(params[:id])
    if !applicant.pets.present?
      pet_to_adopt = Pet.find(params[:pet_to_adopt_id])
      applicant.adopt_pet(pet_to_adopt)
    end
    if params[:status] == "pending"
      
    end
    applicant.update(app_params)
    applicant.save
    redirect_to "/applicants/#{applicant.id}"
  end

  def new

  end

  def create
    applicant = Applicant.create(app_params)
    if applicant.save
      flash.clear
      redirect_to "/applicants/#{applicant.id}"
    else
      redirect_to "/applicants/new"
      flash[:alert] = "Please Enter Data For Each Field"
    end
  end

  def admin
    applicant = Applicant.find(params[:id])
    redirect_to "/applicants/#{applicant.id}?admin=true"
  end

private
  def app_params
    params.permit(:first_name, :last_name, :street_address, :city, :state, :zipcode, :description, :status)
  end
end
