/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.entity.Book_Details;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author rik
 */
public class BookDAOImpl implements BookDAO {

    private Connection conn;

    public BookDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean addBooks(Book_Details b) {
        boolean f = false;
        try {

            PreparedStatement ps = conn.prepareStatement("INSERT into book(bookName,author,price,bookCategory,status,photo,user_Email,pdf) values(?,?,?,?,?,?,?,?)");
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getBookCategory());
            ps.setString(5, b.getStatus());
            ps.setString(6, b.getPhotoName());
            ps.setString(7, b.getEmail());
            
            ps.setString(8, b.getPdfName());
            int i = ps.executeUpdate();
            if (i > 0) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Book_Details> getAllBooks() {
        List<Book_Details> list = new ArrayList<Book_Details>();
        Book_Details b = null;

        try {
            String sql = "Select * from book";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new Book_Details();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                b.setPdfName(rs.getString(9));
                list.add(b);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Book_Details getBookById(int id) {
        Book_Details b = null;
        try {
            String sql = "Select * from book where bookId =?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new Book_Details();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                b.setPdfName(rs.getString(9));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return b;
    }

    public boolean editBooks(Book_Details b) {
        boolean f = false;
        try {
            String sql = "Update book set bookname=?,author=?,price=?,status=? where bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getStatus());
            ps.setInt(5, b.getBookId());
            int i = ps.executeUpdate();
            if (i > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean deleteBooks(int id) {
        boolean f = false;
        try {
            String sql = "Delete from book where bookid =?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Book_Details> getNewBooks() {
        List<Book_Details> list = new ArrayList<Book_Details>();
        Book_Details b = null;
        try {
            String sql = "Select * from book where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New Books");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new Book_Details();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                b.setPdfName(rs.getString(9));
                //b.setIsbn(rs.getString(9));
                list.add(b);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Book_Details> getRecentBooks() {
        List<Book_Details> list = new ArrayList<Book_Details>();
        Book_Details b = null;
        try {
            String sql = "Select * from book where  status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new Book_Details();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                b.setPdfName(rs.getString(9));
                //b.setIsbn(rs.getString(9));
                list.add(b);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Book_Details> getOldBooks() {
        List<Book_Details> list = new ArrayList<Book_Details>();
        Book_Details b = null;
        try {
            String sql = "Select * from book where  bookCategory=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, "Old Books");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new Book_Details();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                b.setPdfName(rs.getString(9));
                //b.setIsbn(rs.getString(9));
                list.add(b);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Book_Details> getAllDownloadBooks(){
        List<Book_Details> list = new ArrayList<Book_Details>();
        Book_Details b = null;
        try {
            String sql = "Select * from book where  bookCategory=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, "E Book");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new Book_Details();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                b.setPdfName(rs.getString(9));
                //b.setIsbn(rs.getString(9));
                list.add(b);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Book_Details> getAllRecentBooks() {
        List<Book_Details> list = new ArrayList<Book_Details>();
        Book_Details b = null;
        try {
            String sql = "Select * from book where  status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new Book_Details();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                b.setPdfName(rs.getString(9));
                //b.setIsbn(rs.getString(9));
                list.add(b);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Book_Details> getAllNewBooks() {
        List<Book_Details> list = new ArrayList<Book_Details>();
        Book_Details b = null;
        try {
            String sql = "Select * from book where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New Books");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new Book_Details();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                b.setPdfName(rs.getString(9));
                //b.setIsbn(rs.getString(9));
                list.add(b);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Book_Details> getAllOldBooks() {
        List<Book_Details> list = new ArrayList<Book_Details>();
        Book_Details b = null;
        try {
            String sql = "Select * from book where  bookCategory=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, "Old Books");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new Book_Details();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                b.setPdfName(rs.getString(9));
                //b.setIsbn(rs.getString(9));
                list.add(b);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Book_Details> getBookByOld(String email, String cat) {
        List<Book_Details> list = new ArrayList<Book_Details>();
        Book_Details b = null;
        try {
            String sql = "select * from book where user_email=? and bookCategory=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, cat);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new Book_Details();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                b.setPdfName(rs.getString(9));
                //b.setIsbn(rs.getString(9));
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public boolean oldBooksDelete(String email,String cat,int id){
        boolean f = false;
        try{
            String sql="delete from book where user_email=? and bookCategory=? and bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, cat);
            ps.setInt(3, id);
            int i = ps.executeUpdate();
            if(i>0){
                return true;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public List<Book_Details> getBookBySearch(String ch){
        List<Book_Details> list = new ArrayList<Book_Details>();
        Book_Details b = null;
        try {
            String sql = "select * from book where bookname like ? or author like ? or bookCategory like ? and status=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+ch+"%");
            ps.setString(2, "%"+ch+"%");
            ps.setString(3, "%"+ch+"%");
            ps.setString(4, "Active");
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new Book_Details();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                b.setPdfName(rs.getString(9));
                //b.setIsbn(rs.getString(9));
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

}
