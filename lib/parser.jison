/* description: parses CSS into tree */

/* lexical grammar */
%lex

%%
[_a-z0-9-]+				{ return 'IDENT'; }
\/\*[^*]*\*\/				{ return 'COMMENT'; }
[ \n]+					{ return 'S'; }
"{"                             	%{ return '{'; %}
"}"                             	%{ return '}'; %}
":"                             	{ return ':'; }
";"                             	{ return ';'; }
<<EOF>>					{ return 'EOF'; }

/lex

/* operator association and precedence */

%start stylesheet

%% /* language grammar */
stylesheet
  : line* EOF
      { var stylesheet = new yy.Stylesheet(); stylesheet.addRule($1); $$ = stylesheet; return stylesheet; }
  ;

line
  : ruleset
    { $$ = $1; }
  | comment
    { $$ = $1; }
  ;

ruleset
  : IDENT S '{' S declaration S '}'
      { $$ = new yy.Ruleset($1, $5); }
  ;

declaration
  : IDENT ':' IDENT ';'
      { $$ = $1 + ":" + $3 + ';'; }
  ;

comment
  : COMMENT
      { $$ = new yy.Comment($1); }
  ;
