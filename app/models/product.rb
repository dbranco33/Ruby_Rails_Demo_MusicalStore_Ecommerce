class Product < ApplicationRecord
  belongs_to :category

  # allows attachment for the column 'image'.
  # it also defines the 'url' for the uploaded pictures.
  has_attached_file :image,
                    styles: { medium: '300x300', thumb: '90X90' },
                    url: '/uploads/products/:id/:style/:basename.:extension',
                    default_url: '/uploads/products/missing.jpg'

  # validation the attachment file.
  validates_attachment :image, content_type: { content_type: ["image/jpeg",
                                                              "image/gif",
                                                              "image/png"] }
  #validates_attachment_content_type :image, content_type: %r{Aimage\/.*\z}

  validates :name, presence: true
end
