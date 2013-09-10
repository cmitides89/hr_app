class CurrentEventsController < ApplicationController
	def new
		@current_event = CurrentEvents.new
	end

	def create
		@current_event = CurrentEvents.new(params[:current_event])
		@current_event.save!
		respond_to do |format|
			if @current_event.save
				format.html{redirect_to @current_event, notice: 'your company current event has been created'}
				format.json {render json: @current_event, status: :created, location: @current_event}
			else
				format.html {render action: "new"}
				format.json {render json: @current_event.errors, status: :unprocessable_entity}
			end
		end
	end

	def edit
		@current_event = CurrentEvent.find(params[:id])
	end

	def show
		@current_event = CurrentEvent.find(params[:id])

	end

	def destroy
		@current_event = CurrentEvent.find(params[:id])
		@current_event.destroy

		respond_to do |format|
			format.html {redirect_to current_events_url}
			format.json {head :no_content}
		end
	end
end
