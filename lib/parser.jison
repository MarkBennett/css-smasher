/* description: parses CSS into tree */

/* lexical grammar */
%lex

%%
\s+				/* skip whitespace */
\/\*[^*]*\*+([^/*][^*]*\*+)*\/	return 'COMMENT';
[_a-z0-9-]*			return 'IDENT';
"{"				return '{';
"}"				return '}';
[\n]*				return 'S';
<<EOF>>				return 'EOF';

/lex

/* operator association and precedence */

%start stylesheet

%% /* language grammar */
stylesheet
  : [ [ comment | ruleset ] S* ]* EOF
      { console.log($1); }
  ;

comment
  : COMMENT
      { yy.addComment($1); return $1; }
  ;

ruleset
  : IDENT '{' IDENT '}'
      { var val = "" + $1 + " " + $2; yy.addRule(val); return val; }
  ;
