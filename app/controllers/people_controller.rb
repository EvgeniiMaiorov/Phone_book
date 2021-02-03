class PeopleController < ActionController::API
    before_action :set_person, only: [:show, :update, :destroy]

    def index
        render json: Person.all.as_json(include: [{email_addresses: {except: [:person_id]}}, {phone_numbers: {except: [:person_id]}}])
    end

    def show     
        render json: @person
    end

    def create
        @person = Person.new(person_params)    
        if @person.save
            render json: @person, include: [{email_addresses: {except: [:person_id]}}, {phone_numbers: {except: [:person_id]}}]
        else
            render json: {errors: @person.errors.full_messages}
        end    
    end

    def update
        if @person.update(person_params)
            render json: @person, include: [{email_addresses: {except: [:person_id]}}, {phone_numbers: {except: [:person_id]}}]
        else
            render json: {errors: @person.errors.full_messages}
        end
    end

    def destroy
        render json: @person.destroy        
    end

    private
    
    def set_person
        @person = Person.find(params[:id])        
    end

    def person_params
        params.require(:person).permit(:first_name, :last_name, email_addresses: [:value], phone_numbers: [:value])        
    end
end
