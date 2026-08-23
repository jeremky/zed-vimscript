(function_definition
  (function_declaration
    name: [(identifier) (scoped_identifier)] @name)) @item

(for_loop
  variable: (identifier) @name) @item

; Only surface `let` at script scope, or global/script-scoped variables anywhere,
; so the outline isn't cluttered with every local variable inside a function.
(script_file
  (let_statement
    .
    [(identifier) (scoped_identifier)] @name) @item)

((let_statement
   .
   (scoped_identifier
     (scope) @_scope
     .
     (identifier)) @name) @item
  (#any-of? @_scope "g:" "s:"))

(autocmd_statement
  (au_event_list) @context
  (pattern) @name) @item

; "augroup END" closes a group rather than declaring one, so exclude it.
((augroup_statement
   (augroup_name) @name) @item
  (#not-eq? @name "END"))

(command_statement
  name: (command_name) @name) @item

(map_statement
  cmd: _ @context
  lhs: (map_side) @name) @item
