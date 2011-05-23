/* description: parses CSS into tree */

/* lexical grammar */
%lex

%%
\/\*[^*]*\*+([^/*][^*]*\*+)*\/	return 'COMMENT';
<<EOF>>				return 'EOF';

/lex

/* operator association and precedence */

%start expressions

%% /* language grammar */
expressions
  : e EOF
      { console.log($1); return $1; }
  ;

e
  : COMMENT
      { $$ = "COMMENT: " + $1; }
  ;
