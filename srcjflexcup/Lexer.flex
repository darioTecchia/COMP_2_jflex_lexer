/* JFlex example: part of Java language lexer specification */
// import java_cup.runtime.*;
/**
* This class is a simple example lexer.
*/


%%

%class Lexer
%type Token
%function nextToken

%unicode

%line
%column

%{
  StringBuffer string = new StringBuffer();

  private Token generateToken(int type) {
    return new Token(type, yyline, yycolumn);
  }
  private Token generateToken(int type, Object value) {
    return new Token(type, yyline, yycolumn, value);
  }

  // prepara file input per lettura e controlla errori
  public boolean initialize(String filePath) {
    try {
      this.zzReader = new java.io.FileReader(filePath);
      return true;
    } catch (java.io.FileNotFoundException e) {
      return false;
    }
  }

  Lexer() { }
%}

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace = {LineTerminator} | [ \t\f]

/* comments */
Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}
TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
// Comment can be the last line of the file, without line terminator.
EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent = ( [^*] | \*+ [^/*] )*

Identifier = [:jletter:] [:jletterdigit:]*

IntegerLiteral = 0 | [1-9][0-9]*

FloatLiteral = (0 | [1-9][0-9]*)\.[0-9]+


%state STRING


%%


<YYINITIAL> {

  /* keywords */
  "if" { return generateToken(Token.IF); }
  "then" { return generateToken(Token.THEN); }
  "else" { return generateToken(Token.ELSE); }
  "while" { return generateToken(Token.WHILE); }

  /* separators */
  "(" { return generateToken(Token.LPAR); }
  ")" { return generateToken(Token.RPAR); }
  "{" { return generateToken(Token.LBRA); }
  "}" { return generateToken(Token.RBRA); }
  "," { return generateToken(Token.COMMA); }
  ";" { return generateToken(Token.SEMI); }

  /* relop */
  "<" { return generateToken(Token.LT); }
  "<=" { return generateToken(Token.LE); }
  "=" { return generateToken(Token.EQ); }
  "<>" { return generateToken(Token.NE); }
  ">" { return generateToken(Token.GT); }
  ">=" { return generateToken(Token.GE); }
  "<--" { return generateToken(Token.ASSIGN); }

  /* identifiers */
  {Identifier}          { return generateToken(Token.ID, yytext()); }

  /* literals */
  {IntegerLiteral}   { return generateToken(Token.INT, Integer.parseInt(yytext())); }
  {FloatLiteral}   { return generateToken(Token.FLOAT, Double.parseDouble(yytext())); }

  // WHEN " IS REACHED IT'S STARTING A STRING
  \" { string.setLength(0); yybegin(STRING); }

  /* comments */
  {Comment} {/* ignore */}

  /* whitespace */
  {WhiteSpace} { /* ignore */ }
}

<<EOF>> { return generateToken(Token.EOF); }

/* error fallback */
[^] { 
  throw new Error("Illegal character <"+yytext()+"> on L: " + yyline + " C: " + yycolumn); 
}