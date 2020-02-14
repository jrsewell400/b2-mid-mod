class ActorsController < ApplicationController 
    def show 
        @actors = Actor.all
    end
end