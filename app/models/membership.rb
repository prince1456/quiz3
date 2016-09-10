class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :idea
  validates :user_id, uniqueness: { scope: :idea_id,
                                    message: "Liked already" }

    def full_name
      "fshjkhkjfk"
    end
end
