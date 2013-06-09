class ItemsController < ApplicationController

	attr_accessor :complete
	before_filter :find_list

	respond_to :html,:xml, :js

	def create
		if @list.user == current_user || @list.user_id == nil
			@item = @list.items.create!(params[:item])
			redirect_to list_url(@list), :notice => 'Item added'
		else
			flash[:error] = "Only the owner of this list can add an item"
			redirect_to list_url(@list)
		end		
	end


	def complete
		@item = @list.items.find(params[:id])
		@item.completed = true
		@item.save
		redirect_to list_url(@list)
	end

	private 

	def find_list
		@list = List.find(params[:list_id])
	end

end
