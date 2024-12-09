package com.cafeteria.app.repository;

import com.cafeteria.app.model.Order;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> {

    public List<Order> findByCustomerEmail(String email);
}
