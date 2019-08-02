public virtual class Play {
    private String title;
    private String author;
    private PlayType genre;
    
    public Play() {
        SYstem.debug('default plauy constructor');
        this.title = '';
        this.author = '';
        this.genre = PlayType.NOTSELECTED;
    }
    
    public Play(String title) {
        this.title = title;
        this.author = '';
        this.genre = PlayType.NOTSELECTED;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public void setAuthor(String author) {
        this.author = author;
    }
    
    public void setGenre(PlayType genre) {
        this.genre = genre;
    }
    
    public String getTitle() {
        return this.title;
    }
    
    public String getAuthor() {
        return this.author;
    }
    
    public PlayType getGenre() {
        return this.genre;
    }
    
    public virtual void display() {
        System.debug('Play Information');
        System.debug('Title: ' + this.title);
        System.debug('Author: ' + this.author);
        System.debug('Genre: ' + this.genre);
    }
    
}