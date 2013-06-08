class ItemsController < ApplicationController

	attr_accessor :complete
	before_filter :find_list

	respond_to :html,:xml, :js

	def create
		@item = @list.items.create!(params[:item])
		redirect_to list_url(@list), :notice => 'Item added'		
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
