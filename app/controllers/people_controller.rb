class PeopleController < ApplicationController
  def new
    @person = Person.new
    @person.addresses.build(address_type: "work" )
    @person.addresses.build(address_type: "home" )
  end

  def create    
    Person.create(person_params)
    redirect_to people_path
  end

  def index
    @people = Person.all
  end

  private

  def person_params
    params.require(:person).permit(:name, addresses_attributes: [:street_adress_1, :street_adress_2, :city, :state, :zipcode, :adresse_type])
  end
end
