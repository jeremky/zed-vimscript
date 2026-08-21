; Block statements: indent the body only, so that "elseif"/"else"/"catch"/
; "finally" line up with their opening keyword instead of being nested under it.
(if_statement (body) @indent)
(elseif_statement (body) @indent)
(else_statement (body) @indent)

(try_statement (body) @indent)
(catch_statement (body) @indent)
(finally_statement (body) @indent)

(function_definition (body) @indent)
(for_loop (body) @indent)
(while_loop (body) @indent)

; Multi-line parentheses, lists and dictionaries
(_
  "(" ")" @end) @indent

(_
  "[" "]" @end) @indent

(_
  "{" "}" @end) @indent

(literal_dictionary
  "}" @end) @indent
