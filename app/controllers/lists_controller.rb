class ListsController < ApplicationController

	respond_to :html, :xml, :js

	def index
		# @lists = List.order(:name).page params[:page]
		respond_with(@lists = List.where(:published => true).order("created_at DESC").page(params[:page]))
	end

	def new 
		@list = List.new
	end

   def publish
		@list = List.find(params[:id])
		@list.published = true
		@list.save
		if @list.save
			flash[:notice] = "List is now public"
			redirect_to list_url(@list)
		else
			flash[:error] = "Could not publish list"
			redirect_to list_url(@list)
		end
	end
  
   def private
		@list = List.find(params[:id])
		@list.published = false
		@list.save
		if @list.save
			flash[:notice] = "List is now private"
			redirect_to list_url(@list)
		else
			flash[:error] = "Could not privatise list"
			redirect_to list_url(@list)
		end
	end
 


	def create 
		@list = List.new(params[:list])

		if user_signed_in? 
			@list.user_id = current_user.id
		end	

		if @list.save
			flash[:notice] = "List created successfully"
			respond_with(@list, :location => list_url(@list))
		else
			flash[:error] = "Could not create list"
			redirect_to new_list_url()
		end
	end

	def show 
		if List.find(params[:id]).published || user_signed_in? && current_user ==  List.find(params[:id]).user || user_signed_in? && current_user.has_role?(:admin)
			@list = List.find(params[:id])
			@item = @list.items.new
		else
			flash[:error] = "Sorry this list is not public."
			redirect_to root_url()
		end
	end

	def edit
		@list = List.find(params[:id])
	end

	def update
		@list = List.find(params[:id])
		if @list.update_attributes(params[:list])
			flash[:notice] = "List updated"
			respond_with(@list, :location => list_url(@list))
		else
			flash[:error] = "Could not update list"
			redirect_to edit_list_path(@list)
		end
	end

	def destroy
		@list = List.find(params[:id])
		if @list.destroy
		flash[:notice] = "List deleted."
		redirect_to lists_url
		else
			flash[:error] = "Unable to delete list."
			redirect_to lists_url

		end

	end

end
