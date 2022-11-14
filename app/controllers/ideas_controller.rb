class IdeasController < ApplicationController
    
    # Callbacks

    before_action :find_idea, only: [:edit, :update, :show, :destroy]

    # Actions
    
    # Read
    def index
        @ideas = Idea.order(created_at: :desc)
    end

    def show

    end

    # Create 
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

    # Update

    def edit
    end

    def update

        if @idea.update(idea_params)
            flash[:success] = "Idea successfully updated!"
            redirect_to @idea
        else
            flash[:error] = "Something went wrong"
            render 'edit'
        end
    end

    def destroy
        @idea.destroy
        flash[:success] = "Idea successfully destroyed"
        redirect_to root_path
    end

    private

    def find_idea
        @idea = Idea.find(params[:id])
    end

    def idea_params
        params.require(:idea).permit(:title, :body)
    end

end
