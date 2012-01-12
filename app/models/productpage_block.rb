class ProductpageBlock < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => [:product_id]
  validate :no_attachement_errors
  has_attached_file :image,
                    :styles => { :mini => '48x48>', :large => '940x940>' },
                    :default_style => :original,
                    :url => "/assets/products/:id/productpage_blocks/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/productpage_blocks/:style/:basename.:extension"
  has_attached_file :popup,
                    :styles => { :mini => '48x48>', :standard => '800x800>', :large => '940x940>'},
                    :default_style => :standard,
                    :url => "/assets/products/:id/productpage_blocks/popup/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/productpage_blocks/popup/:style/:basename.:extension"
  acts_as_list

  # save the w,h of the original image (from which others can be calculated)
  # we need to look at the write-queue for images which have not been saved yet
#  after_post_process :find_dimensions

  def find_dimensions
    temporary = image.queued_for_write[:original]
    filename = temporary.path unless temporary.nil?
    filename = attachment.path if filename.blank?
    geometry = Paperclip::Geometry.from_file(filename)
    self.image_width  = geometry.width
    self.image_height = geometry.height
  end

  # if there are errors from the plugin, then add a more meaningful message
  def no_attachement_errors
    unless image.errors.empty?
      # uncomment this to get rid of the less-than-useful interrim messages
      # errors.clear
      errors.add :image, "Paperclip returned errors for file '#{image_file_name}' - check ImageMagick installation or image source file."
      false
    end
  end
end
