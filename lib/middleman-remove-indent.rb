require 'middleman-core'
require 'middleman-remove-indent/version'

::Middleman::Extensions.register(:remove_indent) do
  require 'middleman-remove-indent/extension'
  ::Middleman::RemoveIndent::Extension
end
