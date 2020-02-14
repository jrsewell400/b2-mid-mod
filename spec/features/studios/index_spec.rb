require 'rails_helper'

RSpec.describe "As a user," do
    describe "when I visit the studio index page" do
        it "I see a list of all the movie studios and, underneath studios, I see all of it's movies." do
            studio_1 = Studio.create(name: 'Comedy Studio')

            studio_2 = Studio.create(name: 'Documentary Studio')

            movie_1 = Movie.create(title: 'Dude Wheres My Car?')

            movie_2 = Movie.create(title: 'Surviving Progress')

            movie_3 = Movie.create(title: 'Cowspiracy')
            
            visit '/'
            expect(page).to have_content('Comedy Studio')
            expect(page).to have_content('Comedy Studio')
            expect(page).to have_content('Comedy Studio')
            expect(page).to have_content('Comedy Studio')
        end
    end
end  

## Story 1
# As a user, 
# When I visit the studio index page
# I see a list of all of the movie studios 
# And underneath each studio, I see the names of all of its movies.