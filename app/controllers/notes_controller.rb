class NotesController < ApplicationController
    before_action :find_note, only: [:show, :edit, :update, :destroy]

    def index
        redirect_to user_path(current_user)
    end

    def show
    end

    def new
        @note = Note.new
    end
    
    def create
        @note = Note.new(note_params(:title, :body))

        if params[:note][:title].blank? && params[:note][:body].blank? 
            
            flash[:errors] = "Note must contain a title OR a body"
            redirect_to new_note_path
            return
        elsif params[:note][:title].blank?
            @note.title = @note.body.truncate(30)
        end
        
        @note.user = current_user
        if @note.save
            redirect_to user_path(current_user.id)
        else
            flash[:error] = @note.errors.full_messages[0]
            redirect_to new_note_path
        end
    end

    def edit
    end

    def update

        if params[:note][:title].blank? && params[:note][:body].blank? 
            flash[:error] = "Note must contain a title OR a body"
            redirect_to edit_note_path
            return
        elsif params[:note][:title].blank?
            @note.title = @note.body.truncate(30)
        end

        if @note.update(note_params(:title, :body))
          redirect_to user_path(@note.user)
        else
            flash[:error] = "Note could not be edited, please try again"
            redirect_to edit_note_path
        end
    end

    def destroy
        note = Note.find(params[:id])
        note.destroy
        redirect_to user_path(current_user)
    end

    private

    def find_note
        @note = Note.find(params[:id])
    end

    def note_params(*args)
        params.require(:note).permit(*args)
    end
end
