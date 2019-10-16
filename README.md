# YASP

Programming language definited for the Compiler course from University.

## Lexical Specification

|Token |Lexeme|Attribute|
|------|------|---------|
|**Delimiters**|
|*-*|Any WS|-|
|**Separators**|
|LPAR|(|-|
|RPAR|)|-|
|LBRA|{|-|
|RBRA|}|-|
|COMMA|,|-|
|SEMI|;|-|
|**Keywords**|
|IF|if|-|
|THEN|then|-|
|ELSE|else|-|
|WHILE|while|-|
|**Identifiers**|
|Any ID|id|Pointer to table entry|
|**Numbers**|
|Any number|NUM|Pointer to table entry|
|**Relops**|
|<|<|LT|
|<=|<=|LE|
|=|=|EQ|
|<>|<>|NE|
|>|>|GT|
|>=|>=|GE|
|<--|<--|ASSIGN|

## Grammar Specification

--

## Notes
The requested *sym* class is named Token