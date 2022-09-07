class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :applicant

  def self.adoption_status(pet_id, applicant_id)
    where(pet_id: pet_id, applicant_id: applicant_id).first.adoption_status
  end
end
