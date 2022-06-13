class Experience < ApplicationRecord
    belongs_to :employee, :optional => true
end
