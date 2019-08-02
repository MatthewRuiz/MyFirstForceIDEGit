public class Square extends Rectangle {
    public Square(Double sideLength) {
        setSideLength(sideLength);
    }
    
    // Given a length, update squares height and width
    private void setSideLength(Double sideLength) {
        this.height = sideLength;
        this.width = sideLength;
    }
}