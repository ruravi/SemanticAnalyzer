class C {
	a : Int;
	b : Bool;
	c : String;
	d : D;
	init(x : Int, y : Bool) : C {
           {
		a <- x;
		b <- y;
		(* dispatch to a method not declared yet - valid *)
		d <- (new D).selfreferences();
		self;
           }
	};
	
	(* Test Int/Bool/String constants, new in assignment *)
	prettyprint(a : Bool, b : Int, c: String) : Bool {
		{
			b <- 35;
			a <- false;
			c <- "A string constant"; 
			c <- new String;
			a <- true;
		}
	};

	(* Test valid if statements, let statements with/without init, cases,
	loops, isvoid, not, arithmetic, compare, neg and equals *)
	allchecks() : Int {
		{
			if b then "True" else prettyprint(b, a, "False") fi;

			(*  Checks that the return types of the two let statements are both the same *)
			(let a : Bool <- true in isvoid a) = (let b : Int, b : Bool in b);
				

			let a : String, b : String, c : D in {
				let a : Bool <- true in isvoid a;
				case a of 
					b : Bool => true;
					b : Int  => (b + 1 ) * 5 / b - 1;
					b : String => b;
				esac;
				
			};
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

	(* method to check self type return *)
	selfreferences() : SELF_TYPE {
		self
	};
};

class D inherits C {
	(* TODO : attribute type chekcing Valid assignment of type D to an object of superclass C *)
	e : C <- selfreferences();
	f : D <- new SELF_TYPE;
};

Class Main {
	main():C {
		-- Test valid dispatch
	  	(new C).init(1,true)
	  	-- TODO: test a static dispatch
	};
};
