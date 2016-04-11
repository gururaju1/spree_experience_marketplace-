Deface::Override.new(
	:virtual_path => "spree/products/show",
  :name => "remove_taxons",
	:remove => "erb[loud]:contains('taxons')",
	:original => "<%= render :partial => 'taxons' %>"
)