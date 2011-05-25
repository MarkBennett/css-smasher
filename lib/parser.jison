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
      { console.log($1); }
  ;

ruleset
  : IDENT S '{' S declaration ';' S '}'
      { var val = "" + $1 + " { " + $5 + "; }"; console.log("ruleset = " + val); yy.addRule(val); return val; }
  ;

declaration
  : IDENT ':' IDENT
      { var val =$1 + ":" + $3; console.log("decleration = " + val); $$ = val; }
  ; 
