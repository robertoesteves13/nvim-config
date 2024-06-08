(const_declaration
  (const_spec
    name: (identifier) @q (#any-contains? @q "Query" "query" "sql" "SQL")
    value: (expression_list
      (raw_string_literal) @injection.content
      (#set! injection.language "sql")
      (#offset! @injection.content 0 1 0 -1)
    )
  )
)


(call_expression
  function: (selector_expression
    operand: (identifier) @_var (#match? @_var "conn")
    field: (field_identifier) @_func (#eq? @_func "Query" "Exec" "QueryRow")
  )
  arguments: (argument_list
    (raw_string_literal) @injection.content
    (#set! injection.language "sql")
    (#offset! @injection.content 0 1 0 -1)
  )
)
