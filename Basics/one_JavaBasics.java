class Book {

    // Instance variables representing the state of a Book
    private String title;
    private String author;
    private int totalPages;
    private int currentPage;

    // Constructor to set up the Book object
    public Book(String title, String author, int totalPages) {
        this.title = title;
        this.author = author;
        this.totalPages = totalPages;
        this.currentPage = 0; // Starting at the beginning of the book
    }

    // Method to turn pages
    public void turnPage() {
        if (currentPage < totalPages) {
            currentPage++;
            System.out.println("Turned to page " + currentPage);
        } else {
            System.out.println("You are at the end of the book!");
        }
    }

    // Method to display book info
    public void displayBookInfo() {
        System.out.println("Book: " + title + " by " + author);
        System.out.println("Total Pages: " + totalPages);
        System.out.println("Current Page: " + currentPage);
    }

}

public class one_JavaBasics {

    public static void main(String[] args) {
        // Creating a new Book object
        Book myFavoriteBook = new Book("Java Development", "Daksh", 300);

        // Displaying book info
        myFavoriteBook.displayBookInfo();

        // Simulating reading by turning pages
        for (int i = 0; i < 5; i++) {
            myFavoriteBook.turnPage();
        }

        // Displaying updated info
        myFavoriteBook.displayBookInfo();
    }
}
