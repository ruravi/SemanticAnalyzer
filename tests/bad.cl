class C {
	a : Int;
	b : Bool;
	init(x : Int, y : Bool) : C {
           {
		a <- x;
		b <- y;
		self;
           }
	};

	(* formal parameter cannot have type SELF_TYPE *)
	copyTo(other : SELF_TYPE) : SELF_TYPE {
		self
	};

	print(n : Int) : Object {
		while 0 <= n loop
			-- do something
			n <- n - 1
		pool
	};
};

Class Main {
	nonmain():C {
	 {
	  (* Formal parameter mismatch *)
	  (new C).init(1,1);

	  (* Illegal number of arguments *)
	  (new C).init(1,true,3);

	  (* undefined method *)
	  (new C).iinit(1,true);

	  (new C);

	  (* Invlaid static dispatch *)
	  (new C)@D.checkLet();
	 }
	};
};

class D inherits C {
	(* Illegal overriding inherited attribute *)
	a : String;
	b : Bool;

	c : String;
	
	(* Invalid Override method by changing signature *)
	copyTo(n : Int) : SELF_TYPE { false }; 

	(* Valid override method. valid return type match *)
	print(n : Int) : Object {
		{
		(* valid dispatch as the first argument of copy gets rejected *)
		copyTo();
		}
	};

	prettyprint(a : Bool, b : Int, c: String) : Bool {
		{
			(* TODO : Valid assignment as LCA of return type always Bool *)
			a <- if b <= 297 then true else false fi;
			(* TODO Invalid assignment as LCA is not Int *) 
			b <- if not a then 397 else new C fi; 
			false;
		}
	};

	(*  Invalid let statement *)
	checkLet() : Int {
		{
			(*  Invalid : Type check arithmetic and return type of case *)
			(case a of 
					b : Bool => true;
					b : Int  => (b + 1 ) * 5 / b - 1;
					b : String => b;
			esac) + 5 ;

			(* Invalid equality with a boolean, type of let is String  *)
			(let a : String, b : String, c : D in {
				b;	
			}) = true;

			(* valid return type, a is of type Int inherited from base class C *)
			a;
		}
	};

	checkWhile() : Int {
		{
			while true loop
				{
					a <- ~9274947;
					b <- (5 < 7);
					b <- (5 <= 7);
					b <- not 5 = 7;
				}
			pool;

			let c : Int <- 24809 in  (a + 1 ) * 5 / c - 1;
		}
	};
};