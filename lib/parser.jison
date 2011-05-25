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
  : IDENT S '{' S IDENT ':' IDENT ';' S '}'
      { var val = "" + $1 + " { " + $5 + ":" + $7 + "; }"; yy.addRule(val); return val; }
  ;
