; Block statements: indent the body only, so that "elseif"/"else"/"catch"/
; "finally" line up with their opening keyword instead of being nested under it.
;
; The aliased (body) node starts at the first row of its *contents*, not at
; the row of the opening keyword, so each rule anchors "@start" on a sibling
; that ends on the keyword's own row. Without this, the first line under each
; keyword (and everything indented relative to it) comes out one level short.
(if_statement
  condition: (_) @start
  (body) @indent)
(elseif_statement
  condition: (_) @start
  (body) @indent)
(else_statement
  "else" @start
  (body) @indent)

(try_statement
  "try" @start
  (body) @indent)
(catch_statement
  "catch" @start
  (body) @indent)
(finally_statement
  "finally" @start
  (body) @indent)

(function_definition
  (function_declaration) @start
  (body) @indent)
(for_loop
  iter: (_) @start
  (body) @indent)
(while_loop
  condition: (_) @start
  (body) @indent)

; Multi-line parentheses, lists and dictionaries
(_
  "(" ")" @end) @indent

(_
  "[" "]" @end) @indent

(_
  "{" "}" @end) @indent

(literal_dictionary
  "}" @end) @indent
