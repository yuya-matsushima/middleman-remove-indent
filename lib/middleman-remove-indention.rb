require "middleman-core"
require "middleman-remove-indention/version"

::Middleman::Extensions.register(:remove_indention) do
  require "middleman-remove-indention/extension"
  ::Middleman::RemoveIndention::Extension
end
