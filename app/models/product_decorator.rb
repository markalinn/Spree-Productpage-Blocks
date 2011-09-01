Product.class_eval do
  has_many :productpage_blocks,
  :order => 'productpage_blocks.position ASC'
end