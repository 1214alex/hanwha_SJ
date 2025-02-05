package algorithm.java.object01;

public class Library {
    private String[] books;
    private int bookCount;
    private String[] users;
    private int userCount;


    public Library(){
    }

    public Library(int books, int users) {
        this.books = new String[books];
        this.users = new String[users];
        bookCount++;
        userCount++;
    }
    public void addBook(Book book) {
        if (books.length != bookCount){
            books[bookCount] = book.title;
        }

    }

    public void registerUer(User user) {
        if (users.length != userCount) {
            users[userCount] = user.userId;
        }
    }

    public void lendBook(String userId, String bookId) {
        for (int i = 0; i < this.users.length; i++) {
            if(users[i] == userId){

            }
        }
    }
}
