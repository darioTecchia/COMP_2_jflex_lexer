# YASPL

Programming language definited for the Compiler course from University.

### Project Part 2
JFlex Coded Lexer

## Regular Definition

|Regular Definition | Regular Expression|
|-------------------|-------------------|
|LineTerminator | `\r|\n|\r\n` |
|InputCharacter | `[^\r\n]` |
|WhiteSpace | `{LineTerminator} | [ \t\f]` |
|||
|Comment | `{TraditionalComment} | {EndOfLineComment} | {DocumentationComment}` |
|TraditionalComment | `"/*" [^*] ~"*/" | "/*" "*"+ "/"` |
|EndOfLineComment | `"//" {InputCharacter}* {LineTerminator}?` |
|DocumentationComment | `"/**" {CommentContent} "*"+ "/"` |
|CommentContent | `( [^*] | \*+ [^/*] )*` |
|||
|Identifier | `[:jletter:] [:jletterdigit:]*` |
|||
|IntegerLiteral | `0 | [1-9][0-9]*` |
|||
|FloatLiteral | `(0 | [1-9][0-9]*)\.[0-9]+` |

## Lexical Specification

|Token |Lexeme or Regular Definition|Attribute|
|------|------|---------|
|**Delimiters**|
|*-*|WhiteSpace|-|
||||
|**Separators**|
|LPAR|(|-|
|RPAR|)|-|
|LBRA|{|-|
|RBRA|}|-|
|COMMA|,|-|
|SEMI|;|-|
||||
|**Keywords**|
|IF|if|-|
|THEN|then|-|
|ELSE|else|-|
|WHILE|while|-|
||||
|**Identifiers**|
|ID|Identifier|Pointer to table entry|
||||
|**Numbers**|
|INT|IntegerLiteral|Pointer to table entry|
|FLOAT|FloatLiteral|Pointer to table entry|
||||
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