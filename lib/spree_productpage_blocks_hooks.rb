class SpreeProductpageBlocksHooks < Spree::ThemeSupport::HookListener
  # custom hooks go here
  insert_after :admin_product_tabs, 'shared/productpage_blocks_product_tabs'
end