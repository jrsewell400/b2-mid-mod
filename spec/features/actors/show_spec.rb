require 'rails_helper'

RSpec.describe "As a user," do
    describe "when I visit an actor's show page" do
        it "I see their name, their age, and a list of the names of all of the movies they are in." do
            actor_1 = Actor.create(name: 'Jane Goodall',
                                   age: '85'
                                  )

            studio = Studio.create(name: 'Documentary Studio')

            movie_2 = studio.movies.create(title: 'Surviving Progress')

            movie_3 = studio.movies.create(title: 'Cowspiracy')
            
            ActorMovie.create(actor: actor_1, movie: movie_2)
            ActorMovie.create(actor: actor_1, movie: movie_3)
            
            visit "/actors/#{actor_1.id}"

            expect(page).to have_content('Jane Goodall')
            expect(page).to have_content('85')
            expect(page).to have_content('Surviving Progress')
            expect(page).to have_content('Cowspiracy')
        end
    end
end  