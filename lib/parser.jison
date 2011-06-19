/* description: parses CSS into tree */

/* lexical grammar */
%lex

h               [0-9a-fA-F]
nonascii        [\200-\377]
nmstart         [_a-zA-Z]|{nonascii}
nmchar          [_a-zA-Z0-9-]|{nonascii}
string1         \"([\t !#$%&(-~]|\\{nl}|\'|{nonascii})*\"
string2         \'([\t !#$%&(-~]|\\{nl}|\"|{nonascii})*\'
num             [0-9]+|[0-9]*"."[0-9]+
intnum          [0-9]+
string          {string1}|{string2}
url             ([!#$%&*-~]|{nonascii})*
w               [ \t\r\n\f]*
nl              \n|\r\n|\r|\f
range           \?{1,6}|{h}(\?{0,5}|{h}(\?{0,4}|{h}(\?{0,3}|{h}(\?{0,2}|{h}(\??|{h})))))
nth             [\+-]?{intnum}*n([\t\r\n ]*[\+-][\t\r\n ]*{intnum})?

%%
[ \t\r\n\f]+            		{ return 'WHITESPACE'; }
[a-zA-Z0-9-_]+				{ return 'IDENT'; }
"#"[a-zA-Z0-9-_]+			{ return 'IDSEL'; }
\/\*[^*]*\*\/				{ return 'COMMENT'; }
"{"                             	%{ return '{'; %}
"}"                             	%{ return '}'; %}
":"                             	{ return ':'; }
";"                             	{ return ';'; }
","                             	{ return ','; }
"."                             	{ return '.'; }
"#"                             	{ return '#'; }
<<EOF>>					{ return 'EOF'; }

/lex

/* operator association and precedence */

%start stylesheet

%% /* language grammar */
stylesheet
  : maybe_space rule_list EOF
      {
        var stylesheet = new yy.Stylesheet();
        stylesheet.lines = $2;
        return stylesheet;
      }
  ;

maybe_space
  : /* empty */
  | maybe_space WHITESPACE
  ;

rule_list
  : /* empty */
  | rule_list rule maybe_space
      {
	var style = $1 || [];
	style.push($2);
	$$ = style;
      }
  ;

rule
  : valid_rule
    { $$ = $1; }
  ;

valid_rule
  : ruleset
    { $$ = $1; }
  | comment
    { $$ = $1; }
  ;

before_rule_opening_brace
  : /* empty */
  ;

ruleset
  : selector_list before_rule_opening_brace '{' maybe_space declarations '}'
    { $$ = new yy.Ruleset($1, $5); }
  ;

selector_list
  : selector
    { $$ = [ $1 ]; }
  | selector_list ',' maybe_space selector
    { var selector_list = $1; $1.push($4); $$ = selector_list; }
  ;

element_name
  : IDENT
    { $$ = $1; }
  ;

class
  : '.' IDENT
    { $$ = "." + $2; }
  ;

specifier
  : IDSEL
    { $$ = $1; }
  | class
    { $$ = $1; }
  ;

specifier_list
  : specifier
    { $$ = $1; }
  | specifier_list specifier
    { $$ = $1 + $2; }
  ;

simple_selector
  : element_name
    { $$ = $1; }
  | element_name specifier_list
    { $$ = $1 + $2; }
  | specifier_list
    { $$ = $1; }
  ;

selector_with_trailing_whitespace
  : selector WHITESPACE
    { $$ = $1; }
  ;

selector
  : simple_selector
    { $$ = $1; }
  | selector_with_trailing_whitespace
    { $$ = $1; }
  | selector_with_trailing_whitespace simple_selector
    { $$ = $1 + " " + $2; }
  ;

declaration_with_trailing_whitespace
  : declaration WHITESPACE
    { $$ = $1; }
  ; 

declarations
  : /* empty */
    { $$ = [] }
  | declarations declaration
    { var declerations = $1; declerations.push($2); $$ = declerations; }
  | declarations declaration_with_trailing_whitespace
    { var declerations = $1; declerations.push($2); $$ = declerations; }
  ;

term
  : IDENT
    { $$ = $1; }
  ;

operator
  : ',' maybe_space
    { $$ = "'"; }
  ;

expr
  : term
    { $$ = [ $1 ]; }
  | expr operator term
    { var expr = $1; expr.push($3); $$ = expr; }
  ;

property
  : IDENT maybe_space
    { $$ = $1; }
  ;

declaration
  : property ':' maybe_space expr ';'
      { $$ = $1 + ":" + $4 + ';'; }
  | property ':' maybe_space expr
      { $$ = $1 + ":" + $4 + ';'; }
  ;

comment
  : COMMENT
      { $$ = new yy.Comment($1); }
  ;
