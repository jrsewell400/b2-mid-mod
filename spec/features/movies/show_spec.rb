require 'rails_helper'

RSpec.describe "As a user," do
    describe "when I visit an movie's show page" do
        before :each do 
            @actor_1 = Actor.create(name: 'Jane Goodall',
                                    age: '85'
                                   )

            @actor_2 = Actor.create(name: 'Stephen Hawking',
                                    age: '69'
                                   )

            @studio = Studio.create(name: 'Documentary Studio')

            @movie_2 = @studio.movies.create(title: 'Surviving Progress',
                                             creation_year: '2011',
                                             genre: 'Documentary')
            
            @movie_3 = @studio.movies.create(title: 'Cowspiracy',
                                             creation_year: '2014',
                                             genre: 'Documentary')
            
            ActorMovie.create(actor: @actor_1, movie: @movie_2)
            ActorMovie.create(actor: @actor_2, movie: @movie_2)
            
        end
        
        it "I see the movie's title, creation year, and genre." do 
            visit "/movies/#{@movie_2.id}"

            expect(page).to have_content('Surviving Progress')
            expect(page).to have_content('2011')
            expect(page).to have_content('Documentary')
        end
        
        it "I see a list of all its actors from youngest to oldest." do
            visit "/movies/#{@movie_2.id}"

            expect(page).to have_content('Jane Goodall')
            expect(page).to have_content('Stephen Hawking')
            expect(page).to have_content('69')
            expect(page).to have_content('85')
        end

        # it "I see the average age of all of the movie's actors." do
        # end 
    end 
end

## Story 3
# As a user, 
# When I visit a movie's show page.
# I see the movie's name, creation year, and genre, 
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors 