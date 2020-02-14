require 'rails_helper'

RSpec.describe "As a user," do
    describe "when I visit the studio index page" do
        it "I see a list of all the movie studios and, underneath studios, I see all of it's movies." do
            studio_1 = Studio.create(name: 'Comedy Studio')

            studio_2 = Studio.create(name: 'Documentary Studio')

            movie_1 = Movie.create(title: 'Dude Wheres My Car?',
                                   studio_id: studio_1.id
                                  )

            movie_2 = Movie.create(title: 'Surviving Progress',
                                   studio_id: studio_2.id
                                  )

            movie_3 = Movie.create(title: 'Cowspiracy',
                                   studio_id: studio_2.id
                                  )
            
            visit '/studios'
            expect(page).to have_content('Comedy Studio')
            expect(page).to have_content('Documentary Studio')
            expect(page).to have_content('Dude Wheres My Car?')
            expect(page).to have_content('Surviving Progress')
            expect(page).to have_content('Cowspiracy')
        end
    end
end  