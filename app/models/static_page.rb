class StaticPage < ActiveRecord::Base
	include ActiveModel::Validations
  	include ActiveModel::Conversion
  	extend ActiveModel::Naming
	attr_accessor :nucleotide

	validates_presence_of :nucleotide
end
