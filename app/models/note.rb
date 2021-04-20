class Note < ApplicationRecord
    belongs_to :user

    validates :title, length: { maximum: 30, message: ": 30 characters is the maximum allowed" }
    validates :body, length: { maximum: 1000, message: ": 1000 characters is the maximum allowed" }

    def time_created
        self.created_at.in_time_zone('Eastern Time (US & Canada)').strftime("%A %l:%M%P")
    end
end