class ItemsController < ApplicationController

	attr_accessor :complete, :remove, :incomplete
	before_filter :find_list

	respond_to :html,:xml, :js

	def create
		if @list.user == current_user || @list.user_id == nil
			@item = @list.items.create!(params[:item])
			if @item.save
				redirect_to list_url(@list), :notice => 'Item added'
			else
				flash[:error] = "Only the owner of this list can add an item"
				redirect_to list_url(@list)
			end	
		end	
	end

	def show 
		@item = Item.find(params[:id])

	end

	def complete
		@item = @list.items.find(params[:id])
		@item.completed = true
		@item.save
		redirect_to list_url(@list)
	end

	def incomplete
		@item = @list.items.find(params[:id])
		@item.completed = false
		@item.save
		redirect_to list_url(@list)
	end

	def remove
		@item = @list.items.find(params[:id])
		@item.list_id = nil
		@item.save
		redirect_to list_url(@list)
		flash[:error] = "Item Removed."
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:item_id])
		if @item.update_attributes(params[:item])
			flash[:notice] = "Item updated"
			redirect_to list_path(@list)
		else
			flash[:error] = "Could not update item"
			redirect_to edit_list_item_path(@list.id, @item.id)
		end
	end


	private 

	def find_list
		@list = List.find(params[:list_id])
	end

end
