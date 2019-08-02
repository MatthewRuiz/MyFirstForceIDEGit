public class Performance extends Play {
    // Fields
    private String theater;
    private Critic performanceCritic;
    
    // Constructors
    
    public Performance() {
        // This constructor will set all fields to empty strings.
        theater = '';
        this.performanceCritic = new Critic();
    }
    
    public Performance(String theater, Critic performanceCritic) {
        this.theater = theater;
        this.performanceCritic = performanceCritic;
    }
    
    // Accessor Methods
    
    public String getTheater() {
        return this.theater;
    }
    
    public Critic getCritic() {
        return this.performanceCritic;
    }
    
    // Mutator Methods
    
    public void setTheater(String theater) {
        this.theater = theater;
    }
    
    public void setCritic(Critic performanceCritic) {
        this.performanceCritic = performanceCritic;
    }
    
    // Diplay Method
    
    public override void display() {
        // This method will display the valies for all fields with appropriate labels.
        super.display();
        System.debug('Theater: ' + this.theater);
        performanceCritic.display();
    }
}