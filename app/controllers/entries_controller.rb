class EntriesController < ApplicationController
    def show
      @entry = Entry.find(params["id"])
    end
    def index
         @entries = Entry.order(date: :desc)
    end
    
    def create
      entry = Entry.create(entry_params)
      entry.date = Date.today
      entry.save
      redirect_to(entry_path(entry))
    end
    
    def edit
      @entry = Entry.find(params["id"])
    end
    
    def update
      entry = Entry.create(entry_params)
      entry = Entry.find(params["id"])
      entry.update(entry_params)
      redirect_to(entry_path(entry))
    end

    def destroy
     entry = Entry.find(params[:id])
     entry.destroy
     redirect_to entries_path
    end
    
    private
    
    def entry_params
      params.require(:entry).permit(:title, :contents)
    end
    
    def entry_params
    params.require(:entry).permit(:title, :contents)
    end

end
