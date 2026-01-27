;; 1. 捕获数组声明时的长度 (例如: int a[5])
(array_declarator
  declarator: (identifier) @arr_name
  size: (number_literal) @declared_size)

;; 2. 捕获数组访问时的下标 (例如: a[5])
;; 我们将这个捕获点命名为 CPP_ARRAY_OOB_LITERAL
;; 注意：这个名字必须与 cpp-defs.json 中的键名一一对应
(subscript_expression
  argument: (identifier) @access_name
  index: (number_literal) @access_index) @CPP_ARRAY_OOB_LITERAL

;; 3. 捕获潜在的空指针使用
(parameter_declaration
  type: (type_identifier)
  declarator: (pointer_declarator) @CPP_NULL_POINTER_DEREF)