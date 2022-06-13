class Certificate < ApplicationRecord
    belongs_to :employee, :optional => true
end
