grammar FuncLang;
 
import ListLang; //Import all rules from ListLang grammar.
 
 // New elements in the Grammar of this Programming Language
 //  - grammar rules start with lowercase

 exp returns [Exp ast]: 
		va=varexp { $ast = $va.ast; }
		| num=numexp { $ast = $num.ast; }
		| str=strexp { $ast = $str.ast; }
		| bl=boolexp { $ast = $bl.ast; }
        | add=addexp { $ast = $add.ast; }
        | sub=subexp { $ast = $sub.ast; }
        | mul=multexp { $ast = $mul.ast; }
        | div=divexp { $ast = $div.ast; }
        | let=letexp { $ast = $let.ast; }
        | lam=lambdaexp { $ast = $lam.ast; }
        | call=callexp { $ast = $call.ast; }
        | i=ifexp { $ast = $i.ast; }
        | less=lessexp { $ast = $less.ast; }
        | eq=equalexp { $ast = $eq.ast; }
        | gt=greaterexp { $ast = $gt.ast; }
        | car=carexp { $ast = $car.ast; }
        | cdr=cdrexp { $ast = $cdr.ast; }
        | cons=consexp { $ast = $cons.ast; }
        | list=listexp { $ast = $list.ast; }
        | nl=nullexp { $ast = $nl.ast; }
        | sw=switchexp { $ast = $sw.ast; }
        ;

 lambdaexp returns [LambdaExp ast] 
        locals [ArrayList<String> formals ]
 		@init { $formals = new ArrayList<String>(); } :
 		'(' Lambda 
 			'(' (id=Identifier { $formals.add($id.text); } )* ')'
 			body=exp 
 		')' { $ast = new LambdaExp($formals, $body.ast); }
 		;

 callexp returns [CallExp ast] 
        locals [ArrayList<Exp> arguments = new ArrayList<Exp>();  ] :
 		'(' f=exp 
 			( e=exp { $arguments.add($e.ast); } )* 
 		')' { $ast = new CallExp($f.ast,$arguments); }
 		;

 ifexp returns [IfExp ast] :
 		'(' If 
 		    e1=exp 
 			e2=exp 
 			e3=exp 
 		')' { $ast = new IfExp($e1.ast,$e2.ast,$e3.ast); }
 		;

 lessexp returns [LessExp ast] :
 		'(' Less 
 		    e1=exp 
 			e2=exp 
 		')' { $ast = new LessExp($e1.ast,$e2.ast); }
 		;

 equalexp returns [EqualExp ast] :
 		'(' Equal 
 		    e1=exp 
 			e2=exp 
 		')' { $ast = new EqualExp($e1.ast,$e2.ast); }
 		;

 greaterexp returns [GreaterExp ast] :
 		'(' Greater 
 		    e1=exp 
 			e2=exp 
 		')' { $ast = new GreaterExp($e1.ast,$e2.ast); }
 		;

 switchexp returns [SwitchExp ast]
     locals [ArrayList<Exp> cases = new ArrayList<Exp>(), ArrayList<Exp> bodies = new ArrayList<Exp>()]:
     '(' 'switch'
        '(' e0=exp ')'
        '(' 'case' e1=exp e1_body=exp ')' { $cases.add($e1.ast); $bodies.add($e1_body.ast); }
        ( '(' 'case' e2=exp e2_body=exp ')' { $cases.add($e2.ast); $bodies.add($e2_body.ast); } )*
        '(' 'default' default_body=exp ')'
        ')' { $ast = new SwitchExp($e0.ast, $cases, $bodies, $default_body.ast); }
     ;
