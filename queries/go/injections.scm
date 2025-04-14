(const_declaration
  (const_spec
    name: (identifier) @q (#any-contains? @q "Query" "query" "sql" "SQL")
    value: (expression_list
      (raw_string_literal
        (raw_string_literal_content) @injection.content
        (#set! injection.language "sql")
      )
    )
  )
)

(call_expression
  function: (selector_expression
    operand: (identifier) @_var (#match? @_var "conn")
    field: (field_identifier) @_func (#any-of? @_func "Query" "Exec" "QueryRow")
  )
  arguments: (argument_list
    (raw_string_literal
      (raw_string_literal_content) @injection.content
      (#set! injection.language "sql")
    )
  )
)
