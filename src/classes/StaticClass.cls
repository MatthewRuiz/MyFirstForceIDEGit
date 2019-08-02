public class StaticClass {
	// static variable
	private static Integer numberOfObjectsCreated = 0;
    // Instance variable
    private Integer secondNumber = 0;
    
    public StaticClass() {
        numberOfObjectsCreated++;
        secondNumber++;
    }
    
    public void incrementSecondNumber() {
        secondNumber++;
    }
    
    public void incrementNumberOfObjectsCreated() {
        numberOfObjectsCreated++;
    }
    
    public Integer getNumberOfObjectsCreated() {
        return numberOfObjectsCreated;
    }
    
    public Integer getSecondNumber() {
        return secondNumber;
    }
}