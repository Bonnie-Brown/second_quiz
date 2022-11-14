class IdeasController < ApplicationController
    
    def new
        @idea = Idea.new 
    end

    def create
        @idea = Idea.new(idea_params)
        
        if @idea.save
            flash[:success] = "Idea successfully created!"
            redirect_to @idea
        else
            render 'new', status: 303
        end
    end

    private

    def idea_params
        params.require(:idea).permit(:title, :body)
    end

end
