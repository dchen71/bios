class StaticPagesController < ApplicationController
	def index

	end

	def search
		@seq = Bio::Sequence::NA.new(params[:nucleotide])
	end
end
