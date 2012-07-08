/* Jison generated parser */
var parser = (function(){
var parser = {trace: function trace() { },
yy: {},
symbols_: {"error":2,"stylesheet":3,"maybe_space":4,"rule_list":5,"EOF":6,"WHITESPACE":7,"rule":8,"valid_rule":9,"ruleset":10,"comment":11,"before_rule_opening_brace":12,"selector_list":13,"{":14,"declarations":15,"}":16,"selector":17,",":18,"element_name":19,"IDENT":20,"class":21,".":22,"specifier":23,"IDSEL":24,"specifier_list":25,"simple_selector":26,"selector_with_trailing_whitespace":27,"declaration_with_trailing_whitespace":28,"declaration":29,"term":30,"operator":31,"expr":32,"property":33,":":34,";":35,"COMMENT":36,"$accept":0,"$end":1},
terminals_: {2:"error",6:"EOF",7:"WHITESPACE",14:"{",16:"}",18:",",20:"IDENT",22:".",24:"IDSEL",34:":",35:";",36:"COMMENT"},
productions_: [0,[3,3],[4,0],[4,2],[5,0],[5,3],[8,1],[9,1],[9,1],[12,0],[10,6],[13,1],[13,4],[19,1],[21,2],[23,1],[23,1],[25,1],[25,2],[26,1],[26,2],[26,1],[27,2],[17,1],[17,1],[17,2],[28,2],[15,0],[15,2],[15,2],[30,1],[31,2],[32,1],[32,3],[33,2],[29,5],[29,4],[11,1]],
performAction: function anonymous(yytext,yyleng,yylineno,yy,yystate,$$,_$) {

var $0 = $$.length - 1;
switch (yystate) {
case 1:
        var stylesheet = new yy.Stylesheet();
        stylesheet.lines = $$[$0-1];
        return stylesheet;
      
break;
case 5:
	var style = $$[$0-2] || [];
	style.push($$[$0-1]);
	this.$ = style;
      
break;
case 6: this.$ = $$[$0]; 
break;
case 7: this.$ = $$[$0]; 
break;
case 8: this.$ = $$[$0]; 
break;
case 10: this.$ = new yy.Ruleset($$[$0-5], $$[$0-1]); 
break;
case 11: this.$ = [ $$[$0] ]; 
break;
case 12: var selector_list = $$[$0-3]; $$[$0-3].push($$[$0]); this.$ = selector_list; 
break;
case 13: this.$ = $$[$0]; 
break;
case 14: this.$ = "." + $$[$0]; 
break;
case 15: this.$ = $$[$0]; 
break;
case 16: this.$ = $$[$0]; 
break;
case 17: this.$ = $$[$0]; 
break;
case 18: this.$ = $$[$0-1] + $$[$0]; 
break;
case 19: this.$ = $$[$0]; 
break;
case 20: this.$ = $$[$0-1] + $$[$0]; 
break;
case 21: this.$ = $$[$0]; 
break;
case 22: this.$ = $$[$0-1]; 
break;
case 23: this.$ = $$[$0]; 
break;
case 24: this.$ = $$[$0]; 
break;
case 25: this.$ = $$[$0-1] + " " + $$[$0]; 
break;
case 26: this.$ = $$[$0-1]; 
break;
case 27: this.$ = [] 
break;
case 28: var declerations = $$[$0-1]; declerations.push($$[$0]); this.$ = declerations; 
break;
case 29: var declerations = $$[$0-1]; declerations.push($$[$0]); this.$ = declerations; 
break;
case 30: this.$ = $$[$0]; 
break;
case 31: this.$ = "'"; 
break;
case 32: this.$ = [ $$[$0] ]; 
break;
case 33: var expr = $$[$0-2]; expr.push($$[$0]); this.$ = expr; 
break;
case 34: this.$ = $$[$0-1]; 
break;
case 35: this.$ = $$[$0-4] + ":" + $$[$0-1] + ';'; 
break;
case 36: this.$ = $$[$0-3] + ":" + $$[$0] + ';'; 
break;
case 37: this.$ = new yy.Comment($$[$0]); 
break;
}
},
table: [{3:1,4:2,6:[2,2],7:[2,2],20:[2,2],22:[2,2],24:[2,2],36:[2,2]},{1:[3]},{5:3,6:[2,4],7:[1,4],20:[2,4],22:[2,4],24:[2,4],36:[2,4]},{6:[1,5],8:6,9:7,10:8,11:9,13:10,17:12,19:15,20:[1,17],21:20,22:[1,21],23:18,24:[1,19],25:16,26:13,27:14,36:[1,11]},{6:[2,3],7:[2,3],16:[2,3],20:[2,3],22:[2,3],24:[2,3],34:[2,3],36:[2,3]},{1:[2,1]},{4:22,6:[2,2],7:[2,2],20:[2,2],22:[2,2],24:[2,2],36:[2,2]},{6:[2,6],7:[2,6],20:[2,6],22:[2,6],24:[2,6],36:[2,6]},{6:[2,7],7:[2,7],20:[2,7],22:[2,7],24:[2,7],36:[2,7]},{6:[2,8],7:[2,8],20:[2,8],22:[2,8],24:[2,8],36:[2,8]},{12:23,14:[2,9],18:[1,24]},{6:[2,37],7:[2,37],20:[2,37],22:[2,37],24:[2,37],36:[2,37]},{7:[1,25],14:[2,11],18:[2,11]},{7:[2,23],14:[2,23],18:[2,23]},{7:[2,24],14:[2,24],18:[2,24],19:15,20:[1,17],21:20,22:[1,21],23:18,24:[1,19],25:16,26:26},{7:[2,19],14:[2,19],18:[2,19],21:20,22:[1,21],23:18,24:[1,19],25:27},{7:[2,21],14:[2,21],18:[2,21],21:20,22:[1,21],23:28,24:[1,19]},{7:[2,13],14:[2,13],18:[2,13],22:[2,13],24:[2,13]},{7:[2,17],14:[2,17],18:[2,17],22:[2,17],24:[2,17]},{7:[2,15],14:[2,15],18:[2,15],22:[2,15],24:[2,15]},{7:[2,16],14:[2,16],18:[2,16],22:[2,16],24:[2,16]},{20:[1,29]},{6:[2,5],7:[1,4],20:[2,5],22:[2,5],24:[2,5],36:[2,5]},{14:[1,30]},{4:31,7:[2,2],20:[2,2],22:[2,2],24:[2,2]},{7:[2,22],14:[2,22],18:[2,22],20:[2,22],22:[2,22],24:[2,22]},{7:[2,25],14:[2,25],18:[2,25]},{7:[2,20],14:[2,20],18:[2,20],21:20,22:[1,21],23:28,24:[1,19]},{7:[2,18],14:[2,18],18:[2,18],22:[2,18],24:[2,18]},{7:[2,14],14:[2,14],18:[2,14],22:[2,14],24:[2,14]},{4:32,7:[2,2],16:[2,2],20:[2,2]},{7:[1,4],17:33,19:15,20:[1,17],21:20,22:[1,21],23:18,24:[1,19],25:16,26:13,27:14},{7:[1,4],15:34,16:[2,27],20:[2,27]},{7:[1,25],14:[2,12],18:[2,12]},{16:[1,35],20:[1,39],28:37,29:36,33:38},{6:[2,10],7:[2,10],20:[2,10],22:[2,10],24:[2,10],36:[2,10]},{7:[1,40],16:[2,28],20:[2,28]},{16:[2,29],20:[2,29]},{34:[1,41]},{4:42,7:[2,2],34:[2,2]},{16:[2,26],20:[2,26]},{4:43,7:[2,2],20:[2,2]},{7:[1,4],34:[2,34]},{7:[1,4],20:[1,46],30:45,32:44},{7:[2,36],16:[2,36],18:[1,49],20:[2,36],31:48,35:[1,47]},{7:[2,32],16:[2,32],18:[2,32],20:[2,32],35:[2,32]},{7:[2,30],16:[2,30],18:[2,30],20:[2,30],35:[2,30]},{7:[2,35],16:[2,35],20:[2,35]},{20:[1,46],30:50},{4:51,7:[2,2],20:[2,2]},{7:[2,33],16:[2,33],18:[2,33],20:[2,33],35:[2,33]},{7:[1,4],20:[2,31]}],
defaultActions: {5:[2,1]},
parseError: function parseError(str, hash) {
    throw new Error(str);
},
parse: function parse(input) {
    var self = this, stack = [0], vstack = [null], lstack = [], table = this.table, yytext = "", yylineno = 0, yyleng = 0, recovering = 0, TERROR = 2, EOF = 1;
    this.lexer.setInput(input);
    this.lexer.yy = this.yy;
    this.yy.lexer = this.lexer;
    this.yy.parser = this;
    if (typeof this.lexer.yylloc == "undefined")
        this.lexer.yylloc = {};
    var yyloc = this.lexer.yylloc;
    lstack.push(yyloc);
    var ranges = this.lexer.options && this.lexer.options.ranges;
    if (typeof this.yy.parseError === "function")
        this.parseError = this.yy.parseError;
    function popStack(n) {
        stack.length = stack.length - 2 * n;
        vstack.length = vstack.length - n;
        lstack.length = lstack.length - n;
    }
    function lex() {
        var token;
        token = self.lexer.lex() || 1;
        if (typeof token !== "number") {
            token = self.symbols_[token] || token;
        }
        return token;
    }
    var symbol, preErrorSymbol, state, action, a, r, yyval = {}, p, len, newState, expected;
    while (true) {
        state = stack[stack.length - 1];
        if (this.defaultActions[state]) {
            action = this.defaultActions[state];
        } else {
            if (symbol === null || typeof symbol == "undefined") {
                symbol = lex();
            }
            action = table[state] && table[state][symbol];
        }
        if (typeof action === "undefined" || !action.length || !action[0]) {
            var errStr = "";
            if (!recovering) {
                expected = [];
                for (p in table[state])
                    if (this.terminals_[p] && p > 2) {
                        expected.push("'" + this.terminals_[p] + "'");
                    }
                if (this.lexer.showPosition) {
                    errStr = "Parse error on line " + (yylineno + 1) + ":\n" + this.lexer.showPosition() + "\nExpecting " + expected.join(", ") + ", got '" + (this.terminals_[symbol] || symbol) + "'";
                } else {
                    errStr = "Parse error on line " + (yylineno + 1) + ": Unexpected " + (symbol == 1?"end of input":"'" + (this.terminals_[symbol] || symbol) + "'");
                }
                this.parseError(errStr, {text: this.lexer.match, token: this.terminals_[symbol] || symbol, line: this.lexer.yylineno, loc: yyloc, expected: expected});
            }
        }
        if (action[0] instanceof Array && action.length > 1) {
            throw new Error("Parse Error: multiple actions possible at state: " + state + ", token: " + symbol);
        }
        switch (action[0]) {
        case 1:
            stack.push(symbol);
            vstack.push(this.lexer.yytext);
            lstack.push(this.lexer.yylloc);
            stack.push(action[1]);
            symbol = null;
            if (!preErrorSymbol) {
                yyleng = this.lexer.yyleng;
                yytext = this.lexer.yytext;
                yylineno = this.lexer.yylineno;
                yyloc = this.lexer.yylloc;
                if (recovering > 0)
                    recovering--;
            } else {
                symbol = preErrorSymbol;
                preErrorSymbol = null;
            }
            break;
        case 2:
            len = this.productions_[action[1]][1];
            yyval.$ = vstack[vstack.length - len];
            yyval._$ = {first_line: lstack[lstack.length - (len || 1)].first_line, last_line: lstack[lstack.length - 1].last_line, first_column: lstack[lstack.length - (len || 1)].first_column, last_column: lstack[lstack.length - 1].last_column};
            if (ranges) {
                yyval._$.range = [lstack[lstack.length - (len || 1)].range[0], lstack[lstack.length - 1].range[1]];
            }
            r = this.performAction.call(yyval, yytext, yyleng, yylineno, this.yy, action[1], vstack, lstack);
            if (typeof r !== "undefined") {
                return r;
            }
            if (len) {
                stack = stack.slice(0, -1 * len * 2);
                vstack = vstack.slice(0, -1 * len);
                lstack = lstack.slice(0, -1 * len);
            }
            stack.push(this.productions_[action[1]][0]);
            vstack.push(yyval.$);
            lstack.push(yyval._$);
            newState = table[stack[stack.length - 2]][stack[stack.length - 1]];
            stack.push(newState);
            break;
        case 3:
            return true;
        }
    }
    return true;
}
};
/* Jison generated lexer */
var lexer = (function(){
var lexer = ({EOF:1,
parseError:function parseError(str, hash) {
        if (this.yy.parser) {
            this.yy.parser.parseError(str, hash);
        } else {
            throw new Error(str);
        }
    },
setInput:function (input) {
        this._input = input;
        this._more = this._less = this.done = false;
        this.yylineno = this.yyleng = 0;
        this.yytext = this.matched = this.match = '';
        this.conditionStack = ['INITIAL'];
        this.yylloc = {first_line:1,first_column:0,last_line:1,last_column:0};
        if (this.options.ranges) this.yylloc.range = [0,0];
        this.offset = 0;
        return this;
    },
input:function () {
        var ch = this._input[0];
        this.yytext += ch;
        this.yyleng++;
        this.offset++;
        this.match += ch;
        this.matched += ch;
        var lines = ch.match(/(?:\r\n?|\n).*/g);
        if (lines) {
            this.yylineno++;
            this.yylloc.last_line++;
        } else {
            this.yylloc.last_column++;
        }
        if (this.options.ranges) this.yylloc.range[1]++;

        this._input = this._input.slice(1);
        return ch;
    },
unput:function (ch) {
        var len = ch.length;
        var lines = ch.split(/(?:\r\n?|\n)/g);

        this._input = ch + this._input;
        this.yytext = this.yytext.substr(0, this.yytext.length-len-1);
        //this.yyleng -= len;
        this.offset -= len;
        var oldLines = this.match.split(/(?:\r\n?|\n)/g);
        this.match = this.match.substr(0, this.match.length-1);
        this.matched = this.matched.substr(0, this.matched.length-1);

        if (lines.length-1) this.yylineno -= lines.length-1;
        var r = this.yylloc.range;

        this.yylloc = {first_line: this.yylloc.first_line,
          last_line: this.yylineno+1,
          first_column: this.yylloc.first_column,
          last_column: lines ?
              (lines.length === oldLines.length ? this.yylloc.first_column : 0) + oldLines[oldLines.length - lines.length].length - lines[0].length:
              this.yylloc.first_column - len
          };

        if (this.options.ranges) {
            this.yylloc.range = [r[0], r[0] + this.yyleng - len];
        }
        return this;
    },
more:function () {
        this._more = true;
        return this;
    },
less:function (n) {
        this.unput(this.match.slice(n));
    },
pastInput:function () {
        var past = this.matched.substr(0, this.matched.length - this.match.length);
        return (past.length > 20 ? '...':'') + past.substr(-20).replace(/\n/g, "");
    },
upcomingInput:function () {
        var next = this.match;
        if (next.length < 20) {
            next += this._input.substr(0, 20-next.length);
        }
        return (next.substr(0,20)+(next.length > 20 ? '...':'')).replace(/\n/g, "");
    },
showPosition:function () {
        var pre = this.pastInput();
        var c = new Array(pre.length + 1).join("-");
        return pre + this.upcomingInput() + "\n" + c+"^";
    },
next:function () {
        if (this.done) {
            return this.EOF;
        }
        if (!this._input) this.done = true;

        var token,
            match,
            tempMatch,
            index,
            col,
            lines;
        if (!this._more) {
            this.yytext = '';
            this.match = '';
        }
        var rules = this._currentRules();
        for (var i=0;i < rules.length; i++) {
            tempMatch = this._input.match(this.rules[rules[i]]);
            if (tempMatch && (!match || tempMatch[0].length > match[0].length)) {
                match = tempMatch;
                index = i;
                if (!this.options.flex) break;
            }
        }
        if (match) {
            lines = match[0].match(/(?:\r\n?|\n).*/g);
            if (lines) this.yylineno += lines.length;
            this.yylloc = {first_line: this.yylloc.last_line,
                           last_line: this.yylineno+1,
                           first_column: this.yylloc.last_column,
                           last_column: lines ? lines[lines.length-1].length-lines[lines.length-1].match(/\r?\n?/)[0].length : this.yylloc.last_column + match[0].length};
            this.yytext += match[0];
            this.match += match[0];
            this.matches = match;
            this.yyleng = this.yytext.length;
            if (this.options.ranges) {
                this.yylloc.range = [this.offset, this.offset += this.yyleng];
            }
            this._more = false;
            this._input = this._input.slice(match[0].length);
            this.matched += match[0];
            token = this.performAction.call(this, this.yy, this, rules[index],this.conditionStack[this.conditionStack.length-1]);
            if (this.done && this._input) this.done = false;
            if (token) return token;
            else return;
        }
        if (this._input === "") {
            return this.EOF;
        } else {
            return this.parseError('Lexical error on line '+(this.yylineno+1)+'. Unrecognized text.\n'+this.showPosition(),
                    {text: "", token: null, line: this.yylineno});
        }
    },
lex:function lex() {
        var r = this.next();
        if (typeof r !== 'undefined') {
            return r;
        } else {
            return this.lex();
        }
    },
begin:function begin(condition) {
        this.conditionStack.push(condition);
    },
popState:function popState() {
        return this.conditionStack.pop();
    },
_currentRules:function _currentRules() {
        return this.conditions[this.conditionStack[this.conditionStack.length-1]].rules;
    },
topState:function () {
        return this.conditionStack[this.conditionStack.length-2];
    },
pushState:function begin(condition) {
        this.begin(condition);
    }});
lexer.options = {};
lexer.performAction = function anonymous(yy,yy_,$avoiding_name_collisions,YY_START) {

var YYSTATE=YY_START
switch($avoiding_name_collisions) {
case 0: return 7; 
break;
case 1: return 20; 
break;
case 2: return 24; 
break;
case 3: return 36; 
break;
case 4: return 14; 
break;
case 5: return 16; 
break;
case 6: return 34; 
break;
case 7: return 35; 
break;
case 8: return 18; 
break;
case 9: return 22; 
break;
case 10: return '#'; 
break;
case 11: return 6; 
break;
}
};
lexer.rules = [/^(?:[ \t\r\n\f]+)/,/^(?:[a-zA-Z0-9-_]+)/,/^(?:#[a-zA-Z0-9-_]+)/,/^(?:\/\*[^*]*\*\/)/,/^(?:\{)/,/^(?:\})/,/^(?::)/,/^(?:;)/,/^(?:,)/,/^(?:\.)/,/^(?:#)/,/^(?:$)/];
lexer.conditions = {"INITIAL":{"rules":[0,1,2,3,4,5,6,7,8,9,10,11],"inclusive":true}};
return lexer;})()
parser.lexer = lexer;function Parser () { this.yy = {}; }Parser.prototype = parser;parser.Parser = Parser;
return new Parser;
})();
if (typeof require !== 'undefined' && typeof exports !== 'undefined') {
exports.parser = parser;
exports.Parser = parser.Parser;
exports.parse = function () { return parser.parse.apply(parser, arguments); }
exports.main = function commonjsMain(args) {
    if (!args[1])
        throw new Error('Usage: '+args[0]+' FILE');
    var source, cwd;
    if (typeof process !== 'undefined') {
        source = require('fs').readFileSync(require('path').resolve(args[1]), "utf8");
    } else {
        source = require("file").path(require("file").cwd()).join(args[1]).read({charset: "utf-8"});
    }
    return exports.parser.parse(source);
}
if (typeof module !== 'undefined' && require.main === module) {
  exports.main(typeof process !== 'undefined' ? process.argv.slice(1) : require("system").args);
}
}