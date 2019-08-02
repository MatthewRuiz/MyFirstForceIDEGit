public virtual class Rectangle extends Shape {
    public Double height {
        get;
        set;
    }
    
    public Double width {
        get;
        set;
    }
    
    public Rectangle() {
        setRectangleNumberOfSides();
        height = 0.0;
        width = 0.0;
    }
    
    public Rectangle(Integer height, Integer width) {
        setRectangleNumberOfSides();
        this.height = height;
        this.width = width;
    }
    
    private void setRectangleNumberOfSides() {
		setNumberOfSides(4);        
    }
    
    public void draw() {
        System.debug('Drawing a rectangle with width: ' + width + ' and height: ' + height);
    }
    
    public Double calculateArea() {
        return width * height;
    }
    
    public Double calculatePerimeter() {
        return 2 * (width + height);
    }
    
}