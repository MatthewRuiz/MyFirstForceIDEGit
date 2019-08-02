// The virtual keyword indicates that this class can be extended. 
public virtual class Person {    
    // Fields
	private String name;
    private String email;
    private Integer age;
    
    // Constructors
    
    // Default/no-arg constructor
    public Person() {
        name = '';
        email = '';
        age = 0;
    }
    
    public Person(String name) {
		this.name = name;
        email = '';
        age = 0;
    }
    
    //public Person(String name, String email) {
    //    this.name = name;
    //    this.email = email;
    //    age = 0;
   // }
    
    public Person(String name, String email, Integer age) {
        this.name = name;
        this.email = email;
        this.age = age;
    }
    
    // Methods
    
    // Accessors (getters)
    public String getName() {
        // Check if logged in user has access.
        return name;
    }
    
    public String getEmail() {
        return email;
    }
    
    public Integer getAge() {
        if (age == null) {
            // Set default value
            age = 0;
        }
    	return age;    
    }  
    
    // Mutators (setters)
    public void setName(String aName) {
        name = aName;
    } 
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setAge(Integer age) {
        // CHeck credentials
        if(age > 0) {
            this.age = age;
        }
    }
    
    // Marking a method as virtual means that it CAN be overriden,
    // but it is not required to be overriden. 
    public virtual void display() {
        System.debug('Name: ' + name);
        System.debug('Email: ' + email);
        System.debug('Age: ' + age);
    }
}