class UpdatesController < ApplicationController
	def new
		@update = Update.new
	end

	def create
		@update = Update.new(params[:update])
		@update.save!
		respond_to do |format|
			if @update.save
				format.html{redirect_to @update, notice: 'your company update has been created'}
				format.json {render json: @update, status: :created, location: @update}
			else
				format.html {render action: "new"}
				format.json {render json: @update.errors, status: :unprocessable_entity}
			end
		end
	end

	def edit
		@update = Update.find(params[:id])
	end

	def show
		@update = Update.find(params[:id])

	end

	def destroy
		@update = Update.find(params[:id])
		@update.destroy

		respond_to do |format|
			format.html {redirect_to updates_url}
			format.json {head :no_content}
		end
	end
end
