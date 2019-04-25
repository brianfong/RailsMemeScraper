class Meme < ApplicationRecord
    validates_uniqueness_of   :name
end
