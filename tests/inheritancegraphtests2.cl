class D inherits Main {
        a: Int;
};

(* Circular inheritance *)
Class Main inherits D {
	a : Int;
	main():C {
	  (new C).init(1,true)
	};
};