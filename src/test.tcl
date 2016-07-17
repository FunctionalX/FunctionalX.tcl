set auto_path [linsert $auto_path 0 [pwd]]
puts $auto_path
package require FunctionalX
namespace import ::FunctionalX::*
puts [head {1 2 3}]