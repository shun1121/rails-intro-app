class Intro < ApplicationRecord
    belongs_to :user
    # mount_uploader :id, IntroductionUploader
    # mount_uploader :hometown, IntroductionUploader
    # mount_uploader :content, IntroductionUploader
    mount_uploader :image, IntroductionUploader
end
