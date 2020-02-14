require 'rails_helper'

RSpec.describe "As a user," do
    describe "when I visit an actor's show page" do
        it "I see their name, their age, and a list of the names of all of the movies they are in." do
            studio_2 = Studio.create(name: 'Documentary Studio')
            
            actor_1 = Actor.create(name: 'Jane Goodall',
                                    age: '85'
                                   )

            movie_2 = Movie.create(title: 'Surviving Progress',
                                   studio_id: studio_2.id
                                  )

            movie_3 = Movie.create(title: 'Cowspiracy',
                                   studio_id: studio_2.id
                                  )
            
            visit "/actors/#{actor_1.id}"

            expect(page).to have_content('Jane Goodall')
            expect(page).to have_content('85')
            expect(page).to have_content('Surviving Progress')
            expect(page).to have_content('Cowspiracy')
        end
    end
end  

## Story 2
# As a user,
# When I visit an actor's show page,
# I see their name, their age, and a list of the names of all of the movies they are in.