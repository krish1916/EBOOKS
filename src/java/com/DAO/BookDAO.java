/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.DAO;

import com.entity.Book_Details;
import java.util.List;

/**
 *
 * @author rik
 */
public interface BookDAO {
    public boolean addBooks(Book_Details b);
    public List<Book_Details> getAllBooks();
    public  Book_Details getBookById(int id);
    public boolean editBooks(Book_Details b);
    public boolean deleteBooks(int id);
    public List<Book_Details> getNewBooks();
    public List<Book_Details> getRecentBooks();
    public List<Book_Details> getOldBooks();
    public List<Book_Details> getAllRecentBooks();
    public List<Book_Details> getAllNewBooks();
    public List<Book_Details> getAllOldBooks();
    public List<Book_Details> getAllDownloadBooks();
    public List<Book_Details> getBookByOld(String email,String cat);
    public boolean oldBooksDelete(String email,String cat,int id);
    public List<Book_Details> getBookBySearch(String ch);
    
}
