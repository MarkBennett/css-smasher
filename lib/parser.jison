/* description: parses CSS into tree */

/* lexical grammar */
%lex

%%
[_a-z0-9-]+			{ return 'IDENT'; }
[ \n]+				{ return 'S'; }
"{"                             %{ return '{'; %}
"}"                             %{ return '}'; %}
":"                             %{ return ':'; %}
";"                             %{ return ';'; %}
<<EOF>>				{ return 'EOF'; }

/lex

/* operator association and precedence */

%start stylesheet

%% /* language grammar */
stylesheet
  : [ ruleset S* ]* EOF
      { var stylesheet = new yy.Stylesheet(); stylesheet.addRule($1); $$ = stylesheet; return stylesheet; }
  ;

ruleset
  : IDENT S '{' S declaration S '}'
      { var ruleset = new yy.Ruleset($1, $5); $$ = ruleset; }
  ;

declaration
  : IDENT ':' IDENT ';'
      { $$ = $1 + ":" + $3 + ';'; }
  ; 
