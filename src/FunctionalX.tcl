package provide FunctionalX 0.0.1

namespace eval FunctionalX {

proc range_aux {start end step accum} {
    if {$start >= $end} {
        return $accum
    } else {
        return [range_aux [expr $start + $step] $end $step [concat $accum [list $start]]]
    }
}

proc range {start end {step 1}} {
    return [range_aux $start $end $step {}]
}

proc head {s} {
    if {[llength $s] == 0} {
        return "NULL"
    } else {
        return [lindex $s 0]
    }
}

proc tail {s} {
    if {[llength $s] <= 1} {
        return {}
    } else {
        return [lrange $s 1 end]
    }
}

proc map_aux {f s accum} {
    if {[llength $s] == 0} {
        return $accum
    } else {
        return [map_aux $f [tail$s] [concat $accum [$f [list [head $s]]]]]
    }
}

proc map {f s} {
    return [map_aux $f $s {}]
}


proc mapv_aux {f s args accum} {
    if {[llength $s] == 0} {
        return $accum
    } else {
        return [mapv_aux $f [tail $s] $args [concat $accum [list [$f [head $s] $args]]]]
    }
}

proc mapv {f s args} {
    return [mapv_aux $f $s $args {}]
}

namespace export range head tail map mapv   
}
