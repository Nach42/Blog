class Article < ApplicationRecord
	belongs_to :user
	has_many :comments
	#Validar cada campo del modelo
	#validates <:campo>, <hash de propiedades>
	#presence: true valida que el elemente no esté vacío
	validates :title, presence: true 
	validates :body, presence: true
	before_create :set_visits_count

	def update_visits_count
		self.update(visits_count: self.visits_count + 1)
	end

	private
	def set_visits_count
		self.visits_count = 0
	end
end
