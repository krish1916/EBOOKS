/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.DAO;

import com.entity.Book_Order;
import java.util.List;

/**
 *
 * @author rik
 */
public interface OrderDAO {
    public boolean saveOrder(List<Book_Order> b);
    public List<Book_Order> getBook(String email);
    public List<Book_Order> getBook();
}
