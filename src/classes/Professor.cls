public class Professor extends Person {
	// Properties
	// MUST be public 
    public Decimal salary {
        get {
            if (salary == null) {
                salary = 0.0;
            }
            
            return salary;
        }
        set {
            // value is a keyword that represents the value a property is being set to.
            if (value < 0.0) {
                System.debug('You cannot have a negative salary. That\'s called debt.');
            } else {
                salary = value;
            }
        }
    }
    
    // THis default constructor will automatically call the parent default constructor.
    public Professor() {
        // parent default is called here
        salary = 0.0;
    }
    
    public Professor(String name, String email) {
        super(name);
        setEmail(email);
    }
    
    public override void display() {
        super.display();
        System.debug('Salary: ' + salary);
    }
}