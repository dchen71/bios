class StaticPagesController < ApplicationController
	def index
		@sp = StaticPage.new
	end

	def search
		if search_params[:nucleotide].length > 0
			seq = Bio::Sequence::NA.new(search_params[:nucleotide])
			if seq.illegal_bases.length == 0
				@seq = Bio::Sequence::NA.new(search_params[:nucleotide])
				@a = (@seq.composition['a'].to_f/@seq.length * 100).round(2) 
				@t = (@seq.composition['t'].to_f/@seq.length * 100).round(2) 
				@g = (@seq.composition['g'].to_f/@seq.length * 100).round(2) 
				@c = (@seq.composition['c'].to_f/@seq.length * 100).round(2) 
				@u = (@seq.composition['u'].to_f/@seq.length * 100).round(2) 
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
