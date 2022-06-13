class Education < ApplicationRecord
    belongs_to :employee, :optional => true
end
