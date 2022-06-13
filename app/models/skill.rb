class Skill < ApplicationRecord
    belongs_to :employee, :optional => true
end
