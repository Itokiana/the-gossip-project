class Comment < ApplicationRecord
  belongs_to :gossips, optional: true
end
