class EntriesController < ApplicationController
    def show
      @entry = Entry.find(params["id"])
    end
    def index
         @entries = Entry.order(date: :asc)
    end
def create
  entry_params = params["entry"].permit("title", "contents")
  entry = Entry.create(entry_params)
  redirect_to(entry_path(entry))
end
end
