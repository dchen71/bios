class StaticPagesController < ApplicationController
	def index
		@sp = StaticPage.new
	end

	def search
		if search_params[:nucleotide].length > 0
			seq = Bio::Sequence::NA.new(search_params[:nucleotide])
			if seq.illegal_bases.length == 0
				@seq = Bio::Sequence::NA.new(search_params[:nucleotide])
			else
				flash[:error] = "Bases can only contain ATGC"
				redirect_to root_path
			end
		else
			flash[:error] = "No string entered"
			redirect_to root_path
		end
	end

	private
	def search_params
		params.require(:static_page).permit(:nucleotide)
	end
end
