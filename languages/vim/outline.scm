(function_definition
  (function_declaration
    name: [(identifier) (scoped_identifier)] @name)) @item

(for_loop
  variable: (identifier) @name) @item

(let_statement
  .
  [(identifier) (scoped_identifier)] @name) @item

(autocmd_statement
  (au_event_list) @context
  (pattern) @name) @item
