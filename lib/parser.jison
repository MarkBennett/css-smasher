/* description: parses CSS into tree */

/* lexical grammar */
%lex

%%
\s+					/* ignore whitespace */
[_a-z0-9-]+				{ return 'IDENT'; }
\/\*[^*]*\*\/				{ return 'COMMENT'; }
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
  : style EOF
      { var stylesheet = new yy.Stylesheet(); stylesheet.lines = $1; return stylesheet; }
  ;

style
  : line
      { $$ = [ $1 ]; }
  | style line
      { var style = $1; style.push($2); $$ = style; }
  ;

line
  : ruleset
    { $$ = $1; }
  | comment
    { $$ = $1; }
  ;

ruleset
  : IDENT '{' declaration '}'
      { $$ = new yy.Ruleset($1, $3); }
  ;

declaration
  : IDENT ':' IDENT ';'
      { $$ = $1 + ":" + $3 + ';'; }
  ;

comment
  : COMMENT
      { $$ = new yy.Comment($1); }
  ;
