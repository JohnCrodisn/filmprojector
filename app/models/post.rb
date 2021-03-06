class Post < ApplicationRecord
	has_and_belongs_to_many :screenings
	has_attached_file :avatar, styles: { medium: "300x300>", small: "100x100>" }, default_url: "/images/:style/missing.png", s3_protocol: "http" 
	validates_attachment_content_type :avatar,
        :content_type => /\Aimage\/.*\Z/

end
