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
","                             	{ return ','; }
<<EOF>>					{ return 'EOF'; }

/lex

/* operator association and precedence */

%start stylesheet

%% /* language grammar */
stylesheet
  : style EOF
      {
        var stylesheet = new yy.Stylesheet();
        stylesheet.lines = $1;
        return stylesheet;
      }
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
  : selectors '{' declarations '}'
    { $$ = new yy.Ruleset($1, $3); }
  ;

selectors
  : selector
    { $$ = [ $1 ]; }
  | selectors ',' selector
    { var selectors = $1; $1.push($3); $$ = selectors; }
  ;

selector
  : IDENT
    { $$ = $1; }
  ;

declarations
  : declaration
    { $$ = [ $1 ]; }
  | declarations declaration
    { var declerations = $1; declerations.push($2); $$ = declerations; }
  ;

declaration_values
  : IDENT
    { $$ = [ $1 ]; }
  | declaration_values ',' IDENT
    { var vals = $1; $1.push($3); $$ = vals; }
  ;

declaration
  : IDENT ':' declaration_values ';'
      { $$ = $1 + ":" + $3 + ';'; }
  | IDENT ':' declaration_values 
      { $$ = $1 + ":" + $3 + ';'; }
  ;

comment
  : COMMENT
      { $$ = new yy.Comment($1); }
  ;
